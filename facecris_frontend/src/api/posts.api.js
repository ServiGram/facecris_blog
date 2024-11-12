import axios from 'axios'

const API_BASE_URL = process.env.NODE_ENV === 'production'
    ? 'http://facecris.net/api/posts/'
    : 'http://127.0.0.1:8000/api/posts/';

const postApi = axios.create({
    baseURL: API_BASE_URL
})

//Puedo hacer el return asi
export const getAllPosts = () => {
    return postApi.get("/")
}

//Puedo hacer el return asi
export const createPost = async (data) => {
    const token = localStorage.getItem('access_token');
    return axios.post(API_BASE_URL, data, {
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'multipart/form-data'
        }
    });
};