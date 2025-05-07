import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import { ChakraProvider } from '@chakra-ui/react';
import './index.css';

const container = document.getElementById('root');

if (container) {
  ReactDOM.createRoot(container).render(
    <React.StrictMode>
      <ChakraProvider>
        <App />
      </ChakraProvider>
    </React.StrictMode>
  );
} else {
  console.error("❌ Error: Root element not found. Make sure <div id='root'></div> is in your index.html.");
}