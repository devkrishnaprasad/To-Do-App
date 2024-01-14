import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBOperations extends GetxController {
  late Database _database;
  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'task_ap.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE IF NOT EXISTS task(
            id INTEGER PRIMARY KEY,
            task_name TEXT NOT NULL,
            task_duration TEXT NOT NULL,
            date TEXT NOT NULL,
            reminder_time TEXT NOT NULL,
            category TEXT NOT NULL,
            status TEXT NOT NULL
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> insertData(Tasks task) async {
    try {
      // Attempt to insert the data
      int result = await _database.insert(
        'task',
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      if (result != -1) {
        // The insertion was successful
        Get.snackbar("Success", "The insertion was successful",
            icon: const Icon(Icons.done_rounded, color: Colors.white),
            colorText: Colors.white,
            backgroundColor: Colors.green,
            margin: const EdgeInsets.only(bottom: 0.0),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 5));
      } else {
        Get.snackbar("Error", "The insertion failed",
            icon: const Icon(Icons.error, color: Colors.white),
            colorText: Colors.white,
            backgroundColor: const Color.fromARGB(255, 236, 18, 18),
            margin: const EdgeInsets.only(bottom: 0.0),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 5));
      }
    } catch (e) {
      // Handle any exceptions that might occur during the insertion
      Get.snackbar("Error", "The insertion failed $e",
          icon: const Icon(Icons.error, color: Colors.white),
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 236, 18, 18),
          margin: const EdgeInsets.only(bottom: 0.0),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
  }

  Future<void> updateStatus(int id) async {
    try {
      await _database.update(
        'task',
        {'status': "true"},
        where: 'id = ?',
        whereArgs: [id],
      );
      Get.snackbar("Success", "Task status updated successfully",
          icon: const Icon(Icons.done_rounded, color: Colors.white),
          colorText: Colors.white,
          backgroundColor: Colors.green,
          margin: const EdgeInsets.only(bottom: 0.0),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    } catch (e) {
      Get.snackbar("Error", "Failed to update task status. $e",
          icon: const Icon(Icons.error, color: Colors.white),
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 236, 18, 18),
          margin: const EdgeInsets.only(bottom: 0.0),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
  }

  Future<List<Tasks>> getData() async {
    final List<Map<String, dynamic>> maps = await _database.query('task');

    return List.generate(maps.length, (i) {
      return Tasks(
          id: maps[i]['id'],
          taskName: maps[i]['task_name'],
          taskDuration: maps[i]['task_duration'],
          date: maps[i]['date'],
          reminderTime: maps[i]['reminder_time'],
          category: maps[i]['category'],
          status: maps[i]['status']);
    });
  }

  Future<void> deleteData(int id) async {
    try {
      await _database.delete(
        'task',
        where: 'id = ?',
        whereArgs: [id],
      );
      Get.snackbar("Success", "Task removed from list",
          icon: const Icon(Icons.done_rounded, color: Colors.white),
          colorText: Colors.white,
          backgroundColor: Colors.green,
          margin: const EdgeInsets.only(bottom: 0.0),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    } catch (e) {
      Get.snackbar("Error", "Failed to remove task. $e",
          icon: const Icon(Icons.error, color: Colors.white),
          colorText: Colors.white,
          backgroundColor: const Color.fromARGB(255, 236, 18, 18),
          margin: const EdgeInsets.only(bottom: 0.0),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
  }

  Future<List<Tasks>> getDataForCurrentDate(date) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      'task',
      where: 'date = ?',
      whereArgs: [date],
    );

    return List.generate(maps.length, (i) {
      return Tasks(
        id: maps[i]['id'],
        taskName: maps[i]['task_name'],
        taskDuration: maps[i]['task_duration'],
        date: maps[i]['date'],
        reminderTime: maps[i]['reminder_time'],
        category: maps[i]['category'],
        status: maps[i]['status'],
      );
    });
  }
}

class Tasks {
  final int? id;
  final String taskName;
  final String taskDuration;
  final String date;
  final String reminderTime;
  final String category;
  final String status;

  Tasks({
    this.id,
    required this.taskName,
    required this.taskDuration,
    required this.date,
    required this.reminderTime,
    required this.category,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task_name': taskName,
      'task_duration': taskDuration,
      'date': date,
      'reminder_time': reminderTime,
      'category': category,
      'status': status,
    };
  }
}
