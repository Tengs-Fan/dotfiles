#!/usr/bin/env python3
import os
import openai

openai.api_key = os.getenv("OPENAI_API_KEY")

message=[
        {"role": "system", "content": "As a proficient programmer, you always think step by step"},
        ]

def append_new_message(info):
    new =  {"role": "user", "content": info}
    message.append(new)
    # return message

# Define a function to generate a chat response
def generate_response():
    # Generate chat response using OpenAI API
    response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            # max_tokens=32768,
            temperature=1.2,
            messages = message
            )
    chat = response["choices"][0]["message"]["content"]
    assist = {"role": "assistant", "content": chat}
    message.append(assist)
    # Return chat response
    return chat

# Start the chat loop
print("Hello! I'm ChatGPT. How can I help you today?")
while True:
    # Get user input
    user_input = input("You: ")
    append_new_message(user_input)
    # Generate chat response
    chat_response = generate_response()
    # Print chat response
    print(chat_response)
