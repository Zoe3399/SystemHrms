import { Box, Flex, Heading } from '@chakra-ui/react';
import Sidebar from '../components/Sidebar';
import { Outlet } from 'react-router-dom';

const MainLayout = () => {
  return (
    <Flex direction="row" minHeight="100vh">
      <Sidebar />
      <Flex direction="column" flex="1">
        <Box bg="blue.600" p={4} color="white">
          <Heading size="md">HR STEM 관리 시스템</Heading>
        </Box>
        <Flex flex="1" p={6}>
          <Outlet />
        </Flex>
      </Flex>
    </Flex>
  );
};

export default MainLayout;