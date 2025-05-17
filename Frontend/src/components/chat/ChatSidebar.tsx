import React from "react";

export default function ChatSidebar() {
  return (
    <aside className="w-64 border-r border-gray-700 flex flex-col">
      <div className="p-4 flex items-center gap-3">
        {/* Logo */}
        <svg
          width="40"
          height="40"
          viewBox="0 0 40 40"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          className="text-gray-400"
        >
          <rect x="5" y="5" width="30" height="30" rx="4" fill="#374151" />
          <path
            d="M12 20C12 16.13 15.13 13 19 13C22.87 13 26 16.13 26 20C26 23.87 22.87 27 19 27C15.13 27 12 23.87 12 20Z"
            fill="#6B7280"
          />
          <path
            d="M26 13H28C29.1 13 30 13.9 30 15V17"
            stroke="white"
            strokeWidth="2"
            strokeLinecap="round"
          />
          <path
            d="M26 27H28C29.1 27 30 26.1 30 25V23"
            stroke="white"
            strokeWidth="2"
            strokeLinecap="round"
          />
          <path
            d="M14 13H12C10.9 13 10 13.9 10 15V17"
            stroke="white"
            strokeWidth="2"
            strokeLinecap="round"
          />
          <path
            d="M14 27H12C10.9 27 10 26.1 10 25V23"
            stroke="white"
            strokeWidth="2"
            strokeLinecap="round"
          />
        </svg>
        <div>
          <h1 className="text-lg font-semibold text-white">ChatBot</h1>
          <p className="text-xs text-gray-400">Modelo IA</p>
        </div>
      </div>

      {/* Botones */}
      <div className="flex p-2 gap-2">
        <button className="w-full flex items-center bg-gray-900 border border-gray-700 hover:bg-gray-800 text-gray-300 px-4 py-2 rounded">
          📄 Prompts
        </button>
        <button className="w-full flex items-center bg-gray-900 border border-gray-700 hover:bg-gray-800 text-gray-300 px-4 py-2 rounded">
          ⚙️ Settings
        </button>
      </div>

      {/* Chats guardados (placeholder) */}
      <div className="mt-4 p-2">
        <div className="border border-gray-700 rounded-md p-3 bg-gray-900/50 hover:bg-gray-900 transition">
          <h2 className="text-sm font-medium text-gray-300">Nuevo Chat</h2>
          <p className="text-xs text-gray-500">0 mensajes</p>
          <p className="text-xs text-gray-500 mt-1">4/9/2025, 10:29:48 PM</p>
        </div>
      </div>

      {/* Footer barra lateral */}
      <div className="mt-auto p-4 flex items-center justify-between">
        <button className="rounded-full h-9 w-9 flex items-center justify-center" />
        <button className="rounded-full h-9 w-9 flex items-center justify-center" />
        <button className="rounded-full h-9 w-9 flex items-center justify-center" />
        <button className="rounded-full bg-gray-800 border border-gray-700 hover:bg-gray-700 text-gray-300 px-4 py-2 w-[500px] h-16">
          Nuevo Chat
        </button>
      </div>
    </aside>
  );
}
