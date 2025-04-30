import { User } from "../types/user";

export async function getUserSession(): Promise<User> {
    try {
        const fetchData = await fetch('api/session', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
        });
        const response = await fetchData.json();
        const data = response.data;
        const user = {
            id: data.id,
            name: data.name,
            email: data.email,
            phone: data.phone,
            nip: data.nip,
            role: data.role,
            created_at: data.created_at,
            updated_at: data.updated_at,
        }
        console.log('User: ', user);
        return user;
    } catch (error) {
        console.log('Get User Error: ', error);
        return {} as User;
    } 
}