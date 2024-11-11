import { BrowserRouter, Routes, Route } from "react-router-dom"
import { Posts } from "./pages/Posts"
import { CreatePost } from "./pages/CreatePost"
import { Navigation } from "./components/Navigation"
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import { Login } from "./components/LoginUser";
import { PrivateRoute } from "./components/PrivateRoutes";
import { AdminPage } from "./pages/Admin/dashboard";



function App() {
  return (
    <BrowserRouter>
      <Navigation />
      <Routes>
        <Route path="/" element={<Posts />} />
        <Route path="/create-post" element={
          <PrivateRoute>
            <CreatePost />
          </PrivateRoute>
        } />
        <Route
          path="/admin"
          element={
            <PrivateRoute isAdminOnly={true}>
              <AdminPage />
            </PrivateRoute>
          }
        />
        <Route path="/login" element={<Login />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App
