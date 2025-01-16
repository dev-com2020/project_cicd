import unittest
from app import hello_world, hello_world2, hello_world3

class TestApp(unittest.TestCase):

    def test_hello(self):
        self.assertEqual(hello_world(),"Witaj świecie!")
    
    def test_hello2(self):
        self.assertEqual(hello_world2(),"Python is awesome!!")
    
    def test_hello3(self):
        self.assertEqual(hello_world3(),"Selenium is awesome!!!")

if __name__ == "__main__":
    unittest.main()