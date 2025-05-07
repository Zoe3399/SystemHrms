import { Box, VStack, Text } from '@chakra-ui/react';
import { Link } from 'react-router-dom';

const Sidebar = () => {
  return (
    <Box bg="gray.700" color="white" minW="200px" p={4}>
      <VStack spacing={4} align="stretch">
        <Link to="/">
          <Text>🏠 홈</Text>
        </Link>
        <Link to="/dashboard">
          <Text>📊 대시보드</Text>
        </Link>
        <Link to="/users">
          <Text>👥 사용자 관리</Text>
        </Link>
        <Link to="/departments">
          <Text>🏢 부서 관리</Text>
        </Link>
        <Link to="/positions">
          <Text>🗂 직급 관리</Text>
        </Link>
      </VStack>
    </Box>
  );
};

export default Sidebar;