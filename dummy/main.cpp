#include <stdio.h>
#include <exception>
#include <iostream>

int main()
{
    try
    {
         printf("hello world!");
         throw std::runtime_error("test!");
    }
    catch(const std::exception& e)
    {
        std::cerr << e.what() << '\n';
    }
}
   