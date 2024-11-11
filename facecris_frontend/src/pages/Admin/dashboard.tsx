import { useEffect, useState } from 'react';
import axios from 'axios';

type User = {
    id: number;
    username: string;
    is_admin: boolean;
};

export const AdminPage = () => {
    const [users, setUsers] = useState<User[]>([]);

    const fetchUsers = async () => {
        const token = localStorage.getItem('access_token');
        const res = await axios.get('http://127.0.0.1:8000/api/users/', {
            headers: { Authorization: `Bearer ${token}` },
        });
        setUsers(res.data);
    };

    const makeAdmin = async (userId: number) => {
        const token = localStorage.getItem('access_token');
        await axios.post(`http://127.0.0.1:8000/api/users/${userId}/assign_admin/`, {}, {
            headers: { Authorization: `Bearer ${token}` },
        });
        fetchUsers();  // Refresh the list
    };

    useEffect(() => {
        fetchUsers();
    }, []);

    return (
        <div>
            <h2>Administrar Usuarios</h2>
            <ul>
                {users.map(user => (
                    <li key={user.id}>
                        {user.username} - {user.is_admin ? 'Admin' : 'Usuario'}
                        {!user.is_admin && (
                            <button onClick={() => makeAdmin(user.id)}>Hacer Admin</button>
                        )}
                    </li>
                ))}
            </ul>
        </div>
    );
};
