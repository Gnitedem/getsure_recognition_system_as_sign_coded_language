import asyncio
import websockets

connected_clients = set()

async def handler(websocket, path):
    # Register new client
    connected_clients.add(websocket)
    print(f"New client connected: {websocket.remote_address}")
    try:
        async for message in websocket:
            print(f"Received message from {websocket.remote_address}: {message}")
            # Broadcast the message to all connected clients
            await asyncio.gather(*[client.send(f"{message}") for client in connected_clients])
    except websockets.exceptions.ConnectionClosed as e:
        print(f"Client disconnected: {websocket.remote_address}")
    finally:
        # Unregister client
        connected_clients.remove(websocket)

async def main():
    async with websockets.serve(handler, "localhost", 8765):
        await asyncio.Future()  # Run forever

if __name__ == "__main__":
    asyncio.run(main())


    
    # async for message in websocket:
    #     await websocket.send(message)

