// src/components/LoginForm.tsx
import { useState } from 'react';

export default function LoginForm() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errorMessage, setErrorMessage] = useState('');

  async function handleLogin(event: React.FormEvent) {
    event.preventDefault();
    setErrorMessage('');

    try {
        const res = await fetch('http://localhost:8001/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: new URLSearchParams({ username: email, password }),
        credentials: 'include'      // << importante
        });

        if (!res.ok) {
        const errorData = await res.json();
        setErrorMessage(errorData.detail || 'Error al iniciar sesión');
        return;
        }

        // ya recibiste cookie; no guardes nada en localStorage
        window.location.href = '/';
    } catch (err) {
        console.error('Error de conexión:', err);
        setErrorMessage('Error de conexión con el servidor');
    }
    }

  return (
    <section className="max-w-md mx-auto bg-[#1e293b] text-white p-8 rounded-xl mt-8 shadow">
      <h1 className="text-2xl font-bold mb-4">Iniciar Sesión</h1>
      <form onSubmit={handleLogin}>
        <div className="mb-4">
          <label htmlFor="email" className="block text-sm font-semibold mb-1">Correo Electrónico</label>
          <input
            id="email"
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
            className="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-600 text-white focus:outline-none focus:ring-2 focus:ring-blue-500"
            placeholder="admin@sitiorama.com"
          />
        </div>
        <div className="mb-4">
          <label htmlFor="password" className="block text-sm font-semibold mb-1">Contraseña</label>
          <input
            id="password"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
            className="w-full px-4 py-2 rounded-lg bg-gray-800 border border-gray-600 text-white focus:outline-none focus:ring-2 focus:ring-blue-500"
            placeholder="Contraseña"
          />
        </div>
        {errorMessage && <div className="mb-4 text-red-400 text-sm">{errorMessage}</div>}
        <button type="submit" className="w-full bg-blue-500 text-white py-2 rounded-md font-semibold hover:bg-blue-600 transition-all">
          Iniciar Sesión
        </button>
      </form>
    </section>
  );
}
