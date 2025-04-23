import React from "react";
import type { Message } from './ChatBot';

export default function MessageBubble({ message }: { message: Message }) {
  const isUser = message.role === "user";
  const bubbleColor = isUser ? "bg-blue-700" : "bg-gray-700";

  return (
    <div className={`flex gap-3 mb-3 ${isUser ? "justify-end" : "justify-start"}`}>
      {/* Avatar */}
      {!isUser && (
        <div className="w-8 h-8 rounded-full bg-gray-700 flex items-center justify-center text-white">
          {message.role === "system" ? "⚙️" : "🤖"}
        </div>
      )}

      {/* Burbuja */}
      <div
        className={`
          p-3 rounded-lg text-gray-200 ${bubbleColor} max-w-[60%]
          ${isUser ? "ml-auto text-right" : "mr-auto text-left"}
        `}
      >
        <p>{message.content}</p>
        <p className="text-xs text-gray-400 mt-1">{message.role.toUpperCase()}</p>
      </div>

      {/* Avatar del usuario al lado derecho */}
      {isUser && (
        <div className="w-8 h-8 rounded-full bg-gray-700 flex items-center justify-center text-white">
          👤
        </div>
      )}
    </div>
  );
}
