import React, { useEffect, useState } from 'react';

export default function UserStatus() {
    const [username, setUsername] = useState<string | null>(null);
    const [role, setRole] = useState<string | null>(null);
    const [showLogout, setShowLogout] = useState(false);

    useEffect(() => {
        fetch('http://localhost:8001/me', {
            credentials: 'include',
        })
        .then(async res => {
            if (res.ok) {
                const data = await res.json();
                setUsername(data.name);
                setRole(data.role);             // <-- guardamos el rol
                console.log('Rol del usuario:', data.role); 
            }
        })
        .catch(() => {
            setUsername(null);
            setRole(null);
        });
    }, []);

    const handleLogout = async () => {
        await fetch('http://localhost:8001/logout', {
            method: 'POST',
            credentials: 'include',
        });
        setUsername(null);
        setRole(null);                         // <-- limpiamos el rol
        setShowLogout(false);
    };

    if (username) {
        return (
            <div className="text-sm px-4 py-2 border border-gray-600 rounded text-white flex flex-col items-start space-y-2">
                <span
                    className="cursor-pointer text-white hover:underline"
                    onClick={() => setShowLogout(!showLogout)}
                >
                    Bienvenido, {username}
                </span>

                {showLogout && (
                    <button
                        onClick={handleLogout}
                        className="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded"
                    >
                        Cerrar sesión
                    </button>
                )}

                {role === 'admin' && (
                    <nav className="mt-2 space-y-1">
                        <a
                            href="/admin/modify-places"
                            className="block text-sm text-blue-300 hover:underline"
                        >
                            Modificar Lugares
                        </a>
                        <a
                            href="/admin/add-place"
                            className="block text-sm text-blue-300 hover:underline"
                        >
                            Añadir Lugar
                        </a>
                    </nav>
                )}
            </div>
        );
    }

    return (
        <a
            href="/login"
            className="text-sm px-4 py-2 border border-gray-600 rounded text-white hover:border-white flex items-center space-x-3"
        >
            <span>Iniciar sesión</span>
        </a>
    );
}