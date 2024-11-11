import axios from 'axios'

const postApi = axios.create({
    baseURL: "http://127.0.0.1:8000/api/posts/"
})

//Puedo hacer el return asi
export const getAllPosts = () => {
    return postApi.get("/")
}

//Puedo hacer el return asi
export const createPost = async (data) => {
    const token = localStorage.getItem('access_token');
    return axios.post('http://127.0.0.1:8000/api/posts/', data, {
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'multipart/form-data'
        }
    });
};