import { BrowserRouter, Routes, Route } from 'react-router-dom';
import MainLayout from './layouts/MainLayout';
import Home from './pages/Home';
import Dashboard from './pages/Dashboard';
import Users from './pages/Users';
import Departments from './pages/Departments';
import Positions from './pages/Positions';

const App: React.FC = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainLayout />}>
          <Route index element={<Home />} />
          <Route path="dashboard" element={<Dashboard />} />
          <Route path="users" element={<Users />} />
          <Route path="departments" element={<Departments />} />
          <Route path="positions" element={<Positions />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
};

export default App;