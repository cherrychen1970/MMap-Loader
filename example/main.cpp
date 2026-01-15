#include <MMapLoader/PortableExecutable.h>

using MMapLoader::PortableExecutable;

int main()
{
  PortableExecutable exe;
  if (auto res = exe.Load("../dummy/dummy.exe"); res.has_value() == true)
  {
    // handle load failure. most of the time a sensical NTSTATUS or windows error (DWORD) is returned.
    // in some cases such as signature failure, STATUS_ACPI_FAILURE is returned. another custom NTSTATUS
    // return code is STATUS_OBJECTID_NOT_FOUND, in the event that an imported module was not found
  }
//   PortableExecutable dll;
//   if (auto res = dll.Load("bar.dll"); res.has_value() == true)
//   {
//     // handle this too
//   }
//   // let's say we want to run bar::DllMain before foo::WinMain
//   if (dll.Run() == FALSE)
//   {
//     // the DLL returned false. handle this accordingly, as per MSDN this indicates failure
//   }
  exe.Run();
  return 0;
}