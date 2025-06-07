import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moltaqa/features/auth/data/models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // // Check if user is logged in
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Get current user
  User? get currentUser => _firebaseAuth.currentUser;

  // Email & Password Sign Up
  Future<UserCredential> createUser({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      final userCred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userModel = UserModel(
        uid: userCred.user?.uid,
        email: userCred.user!.email,
        username: userName,
        playingSince: DateTime.now().toIso8601String(),
        stats: Stats(),
      );
      await _createUserProfile(uid: userCred.user!.uid, user: userModel);
      return userCred;
    } on FirebaseAuthException catch (e) {
      await signOut();
      throw _handleAuthException(e);
    } catch (e) {
      log("An unknown error occurred: $e");
      await signOut();
      throw Exception("User creation Failed, Please try again");
    }
  }

  // Email & Password Sign In
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      log("An unknown error occurred: $e");
      throw Exception("An unknown error occurred: $e");
    }
  }

  // Sign Out
  Future<void> signOut() async {
    if (_firebaseAuth.currentUser != null) {
      await _firebaseAuth.signOut();
      if (currentUser == null) {
        log("User successfully signed out");
      } else {
        log("Sign out failed");
      }
    }
  }

  // Password Reset
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      log("reset email sent");
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      log("An unknown error occurred: $e");
      throw Exception("An unknown error occurred: $e");
    }
  }

  // Delete Account
  // Future<void> deleteAccount() async {
  //   try {
  //     await _firebaseAuth.currentUser?.delete();
  //   } on FirebaseAuthException catch (e) {
  //     throw _handleAuthException(e);
  //   }
  // }

  // Error Handling
  Exception _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return Exception('Invalid email address');
      case 'user-disabled':
        return Exception('This account has been disabled');
      case 'user-not-found':
        return Exception('No account found for this email');
      case 'wrong-password':
        return Exception('Incorrect password');
      case 'email-already-in-use':
        return Exception('Email already in use');
      case 'operation-not-allowed':
        return Exception('Email/password accounts are not enabled');
      case 'weak-password':
        return Exception('Password is too weak');
      case 'requires-recent-login':
        return Exception('Please reauthenticate to perform this action');
      case 'invalid-credential':
      case 'invalid-credentials':
        return Exception('Invalid email or password combination');

      default:
        log('Authentication error: ${e.message}');
        return Exception('Login failed. Please try again');
    }
  }

  Future<void> _createUserProfile({
    required String uid,
    required UserModel user,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).set(user.toJson());
      log(user.toJson().toString());
    } catch (e) {
      log("Failed to create user profile: $e");
      // Cleanup sequence
      try {
        // 1. Delete the auth user
        await _firebaseAuth.currentUser?.delete();

        // 2. Force logout (in case deletion doesn't immediately trigger auth state change)
        await _firebaseAuth.signOut();

        log("Rollback complete: Auth user deleted and session cleared");
      } catch (cleanupError) {
        log("Cleanup failed: $cleanupError");
        throw Exception("Profile creation failed Please try again");
      }
      throw Exception("Failed to create user profile Please try again");
    }
  }
}
