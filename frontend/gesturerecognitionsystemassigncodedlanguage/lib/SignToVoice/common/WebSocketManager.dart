import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketManager {
  static final WebSocketManager _instance = WebSocketManager._internal();
  late WebSocketChannel _channel;
  bool _isConnected = false;
  final String _socketAddress = "ws://127.0.0.1:8765";
  Timer? _reconnectTimer;
  final StreamController<String> _streamController = StreamController<String>.broadcast();

  factory WebSocketManager() {
    return _instance;
  }

  WebSocketManager._internal() {
    _connect();
  }

  Stream<String> get stream => _streamController.stream;

  void _connect() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(_socketAddress));
      _isConnected = true;
      print("Connected to WebSocket at $_socketAddress");

      _channel.stream.listen(
        (message) {
          // print("SWebSocketChannel socket client recieve: $message");
          _streamController.add(message);
        },
        onError: (error) {
          print("WebSocket error: $error");
          _isConnected = false;
          _attemptReconnect();
        },
        onDone: () {
          print("WebSocket connection closed");
          _isConnected = false;
          _attemptReconnect();
        },
      );
    } catch (e) {
      print("Error connecting to WebSocket: $e");
      _isConnected = false;
      _attemptReconnect();
    }
  }

  void _attemptReconnect() {
    if (_reconnectTimer != null && _reconnectTimer!.isActive) {
      return;
    }
    _reconnectTimer = Timer(const Duration(seconds: 3), () {
      print("Attempting to reconnect to WebSocket...");
      _connect();
    });
  }

  void sendMessage(String message) {
    if (_isConnected) {
      _channel.sink.add(message);
    } else {
      print("WebSocket is not connected, message not sent");
    }
  }

  void closeConnection() {
    _channel.sink.close(status.goingAway);
    _isConnected = false;
  }
}
