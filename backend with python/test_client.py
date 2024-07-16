#!/usr/bin/env python

import asyncio
import websockets

async def hello():
    uri = "ws://localhost:8765"
    async with websockets.connect(uri) as websocket:
        await websocket.send("Hello world 345678!")
        print("Message sent to server")

asyncio.run(hello())


#!/usr/bin/env python
# import asyncio
# # import websockets
# from websockets.sync.client import connect

# async def test_websocket():
#     try:
#         # async with websockets.connect(uri) as websocket:
            
#         async with  connect("ws://localhost:8765") as websocket:
#             clientMessage=f'"Hello world!"'
#             websocket.send(f'client sent : {clientMessage}')
#             message = await websocket.recv()
#             print(f"Client Received: {message}")
#     except Exception as e:
#         print(f"Error: {e}")
        

# asyncio.run(test_websocket())
