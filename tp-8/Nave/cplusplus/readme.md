
Map
Key -> tipo string
value -> tipo Sector o Tripulante

Max Heap -> Tripulante

Set-> SetorId y Nombre

## TP 8 Nave
- cls; g++ -std=c++11 -O2 -o tp-8\Nave\cplusplus\tp-8.exe tp-8\Nave\cplusplus\tp-8.cpp; tp-8\Nave\cplusplus\tp-8.exe


- cls; g++ -std=c++11 -O2 -o tp-8\Nave\cplusplus\tp-8.exe tp-8\Nave\cplusplus\tp-8.cpp tp-8\Nave\cplusplus\componente\Componente.cpp tp-8\Nave\cplusplus\map\Map.cpp tp-8\Nave\cplusplus\maxHeap\MaxHeap.cpp tp-8\Nave\cplusplus\nave\Nave.cpp tp-8\Nave\cplusplus\Sector\Sector.cpp tp-8\Nave\cplusplus\set\Set.cpp tp-8\Nave\cplusplus\Tripulante\Tripulante.cpp tp-8\Nave\cplusplus\value\Value.cpp; tp-8\Nave\cplusplus\tp-8.exe   



tp-8\Nave\cplusplus\map\Map.cpp: In function 'std::__cxx11::string lookupM(std::__cxx11::string, Map)':
tp-8\Nave\cplusplus\map\Map.cpp:50:28: error: could not convert 'actual->NodoM::value' from 'Value' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
             return actual->value;
                    ~~~~~~~~^~~~~
tp-8\Nave\cplusplus\map\Map.cpp: In function 'std::__cxx11::string* domM(Map)':
tp-8\Nave\cplusplus\map\Map.cpp:108:10: error: request for member 'reserve' in 'keys', which is of pointer type 'std::__cxx11::string* {aka std::__cxx11::basic_string<char>*}' (maybe you meant to use '->' ?)
     keys.reserve(m->cantidad);
          ^~~~~~~
tp-8\Nave\cplusplus\map\Map.cpp:111:14: error: request for member 'push_back' in 'keys', which is of pointer type 'std::__cxx11::string* {aka std::__cxx11::basic_string<char>*}' (maybe you meant to use '->' ?)
         keys.push_back(actual->key);
              ^~~~~~~~~
tp-8\Nave\cplusplus\map\Map.cpp: In function 'void showMap(Map)':
tp-8\Nave\cplusplus\map\Map.cpp:128:39: error: no match for 'operator<<' (operand types are 'std::basic_ostream<char>' and 'Value')
         cout << actual->key << " -> " << actual->value;
         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:108:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(std::basic_ostream<_CharT, _Traits>::__ostream_type& (*)(std::basic_ostream<_CharT, _Traits>::__ostream_type&)) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(__ostream_type& (*__pf)(__ostream_type&))
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:108:7: note:   no known conversion for argument 1 from 'Value' to 'std::basic_ostream<char>::__ostream_type& (*)(std::basic_ostream<char>::__ostream_type&) {aka std::basic_ostream<char>& (*)(std::basic_ostream<char>&)}'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:117:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(std::basic_ostream<_CharT, _Traits>::__ios_type& (*)(std::basic_ostream<_CharT, _Traits>::__ios_type&)) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>; std::basic_ostream<_CharT, _Traits>::__ios_type = std::basic_ios<char>]
       operator<<(__ios_type& (*__pf)(__ios_type&))
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:117:7: note:   no known conversion for argument 1 from 'Value' to 'std::basic_ostream<char>::__ios_type& (*)(std::basic_ostream<char>::__ios_type&) {aka std::basic_ios<char>& (*)(std::basic_ios<char>&)}'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:127:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(std::ios_base& (*)(std::ios_base&)) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(ios_base& (*__pf) (ios_base&))
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:127:7: note:   no known conversion for argument 1 from 'Value' to 'std::ios_base& (*)(std::ios_base&)'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:166:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(long int) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(long __n)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:166:7: note:   no known conversion for argument 1 from 'Value' to 'long int'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:170:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(long unsigned int) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(unsigned long __n)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:170:7: note:   no known conversion for argument 1 from 'Value' to 'long unsigned int'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:174:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(bool) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(bool __n)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:174:7: note:   no known conversion for argument 1 from 'Value' to 'bool'
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:638:0,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ostream.tcc:91:5: note: candidate: std::basic_ostream<_CharT, _Traits>& std::basic_ostream<_CharT, _Traits>::operator<<(short int) [with _CharT = char; _Traits = std::char_traits<char>]
     basic_ostream<_CharT, _Traits>::
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ostream.tcc:91:5: note:   no known conversion for argument 1 from 'Value' to 'short int'
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:181:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(short unsigned int) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(unsigned short __n)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:181:7: note:   no known conversion for argument 1 from 'Value' to 'short unsigned int'
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:638:0,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ostream.tcc:105:5: note: candidate: std::basic_ostream<_CharT, _Traits>& std::basic_ostream<_CharT, _Traits>::operator<<(int) [with _CharT = char; _Traits = std::char_traits<char>]
     basic_ostream<_CharT, _Traits>::
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ostream.tcc:105:5: note:   no known conversion for argument 1 from 'Value' to 'int'
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:192:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(unsigned int) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(unsigned int __n)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:192:7: note:   no known conversion for argument 1 from 'Value' to 'unsigned int'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:201:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(long long int) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(long long __n)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:201:7: note:   no known conversion for argument 1 from 'Value' to 'long long int'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:205:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(long long unsigned int) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(unsigned long long __n)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:205:7: note:   no known conversion for argument 1 from 'Value' to 'long long unsigned int'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:220:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(double) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(double __f)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:220:7: note:   no known conversion for argument 1 from 'Value' to 'double'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:224:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(float) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(float __f)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:224:7: note:   no known conversion for argument 1 from 'Value' to 'float'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:232:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(long double) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(long double __f)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:232:7: note:   no known conversion for argument 1 from 'Value' to 'long double'
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:245:7: note: candidate: std::basic_ostream<_CharT, _Traits>::__ostream_type& std::basic_ostream<_CharT, _Traits>::operator<<(const void*) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__ostream_type = std::basic_ostream<char>]
       operator<<(const void* __p)
       ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:245:7: note:   no known conversion for argument 1 from 'Value' to 'const void*'
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:638:0,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ostream.tcc:119:5: note: candidate: std::basic_ostream<_CharT, _Traits>& std::basic_ostream<_CharT, _Traits>::operator<<(std::basic_ostream<_CharT, _Traits>::__streambuf_type*) [with _CharT = char; _Traits = std::char_traits<char>; std::basic_ostream<_CharT, _Traits>::__streambuf_type = std::basic_streambuf<char>]
     basic_ostream<_CharT, _Traits>::
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ostream.tcc:119:5: note:   no known conversion for argument 1 from 'Value' to 'std::basic_ostream<char>::__streambuf_type* {aka std::basic_streambuf<char>*}'
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\string:52:0,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\locale_classes.h:40,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ios_base.h:41,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ios:42,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:38,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\basic_string.h:5325:5: note: candidate: template<class _CharT, class _Traits, class _Alloc> std::basic_ostream<_CharT, _Traits>& std::operator<<(std::basic_ostream<_CharT, _Traits>&, const std::__cxx11::basic_string<_CharT, _Traits, _Alloc>&)
     operator<<(basic_ostream<_CharT, _Traits>& __os,
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\basic_string.h:5325:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   'Value' is not derived from 'const std::__cxx11::basic_string<_CharT, _Traits, _Alloc>'
         cout << actual->key << " -> " << actual->value;
                                                  ^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ios_base.h:46:0,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ios:42,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:38,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\system_error:209:5: note: candidate: template<class _CharT, class _Traits> std::basic_ostream<_CharT, _Traits>& std::operator<<(std::basic_ostream<_CharT, _Traits>&, const std::error_code&)
     operator<<(basic_ostream<_CharT, _Traits>& __os, const error_code& __e)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\system_error:209:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   cannot convert 'actual->NodoM::value' (type 'Value') to type 'const std::error_code&'
         cout << actual->key << " -> " << actual->value;
                                          ~~~~~~~~^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:497:5: note: candidate: template<class _CharT, class _Traits> std::basic_ostream<_CharT, _Traits>& std::operator<<(std::basic_ostream<_CharT, _Traits>&, _CharT)
     operator<<(basic_ostream<_CharT, _Traits>& __out, _CharT __c)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:497:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   deduced conflicting types for parameter '_CharT' ('char' and 'Value')
         cout << actual->key << " -> " << actual->value;
                                                  ^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:502:5: note: candidate: template<class _CharT, class _Traits> std::basic_ostream<_CharT, _Traits>& std::operator<<(std::basic_ostream<_CharT, _Traits>&, char)
     operator<<(basic_ostream<_CharT, _Traits>& __out, char __c)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:502:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   cannot convert 'actual->NodoM::value' (type 'Value') to type 'char'
         cout << actual->key << " -> " << actual->value;
                                          ~~~~~~~~^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:508:5: note: candidate: template<class _Traits> std::basic_ostream<char, _Traits>& std::operator<<(std::basic_ostream<char, _Traits>&, char)
     operator<<(basic_ostream<char, _Traits>& __out, char __c)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:508:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   cannot convert 'actual->NodoM::value' (type 'Value') to type 'char'
         cout << actual->key << " -> " << actual->value;
                                          ~~~~~~~~^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:514:5: note: candidate: template<class _Traits> std::basic_ostream<char, _Traits>& std::operator<<(std::basic_ostream<char, _Traits>&, signed char)
     operator<<(basic_ostream<char, _Traits>& __out, signed char __c)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:514:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   cannot convert 'actual->NodoM::value' (type 'Value') to type 'signed char'
         cout << actual->key << " -> " << actual->value;
                                          ~~~~~~~~^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:519:5: note: candidate: template<class _Traits> std::basic_ostream<char, _Traits>& std::operator<<(std::basic_ostream<char, _Traits>&, unsigned char)
     operator<<(basic_ostream<char, _Traits>& __out, unsigned char __c)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:519:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   cannot convert 'actual->NodoM::value' (type 'Value') to type 'unsigned char'
         cout << actual->key << " -> " << actual->value;
                                          ~~~~~~~~^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:539:5: note: candidate: template<class _CharT, class _Traits> std::basic_ostream<_CharT, _Traits>& std::operator<<(std::basic_ostream<_CharT, _Traits>&, const _CharT*)
     operator<<(basic_ostream<_CharT, _Traits>& __out, const _CharT* __s)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:539:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   mismatched types 'const _CharT*' and 'Value'
         cout << actual->key << " -> " << actual->value;
                                                  ^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:638:0,
                 from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ostream.tcc:321:5: note: candidate: template<class _CharT, class _Traits> std::basic_ostream<_CharT, _Traits>& std::operator<<(std::basic_ostream<_CharT, _Traits>&, const char*)
     operator<<(basic_ostream<_CharT, _Traits>& __out, const char* __s)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\bits\ostream.tcc:321:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   cannot convert 'actual->NodoM::value' (type 'Value') to type 'const char*'
         cout << actual->key << " -> " << actual->value;
                                          ~~~~~~~~^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:556:5: note: candidate: template<class _Traits> std::basic_ostream<char, _Traits>& std::operator<<(std::basic_ostream<char, _Traits>&, const char*)
     operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:556:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   cannot convert 'actual->NodoM::value' (type 'Value') to type 'const char*'
         cout << actual->key << " -> " << actual->value;
                                          ~~~~~~~~^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:569:5: note: candidate: template<class _Traits> std::basic_ostream<char, _Traits>& std::operator<<(std::basic_ostream<char, _Traits>&, const signed char*)
     operator<<(basic_ostream<char, _Traits>& __out, const signed char* __s)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:569:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   cannot convert 'actual->NodoM::value' (type 'Value') to type 'const signed char*'
         cout << actual->key << " -> " << actual->value;
                                          ~~~~~~~~^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:574:5: note: candidate: template<class _Traits> std::basic_ostream<char, _Traits>& std::operator<<(std::basic_ostream<char, _Traits>&, const unsigned char*)
     operator<<(basic_ostream<char, _Traits>& __out, const unsigned char* __s)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:574:5: note:   template argument deduction/substitution failed:
tp-8\Nave\cplusplus\map\Map.cpp:128:50: note:   cannot convert 'actual->NodoM::value' (type 'Value') to type 'const unsigned char*'
         cout << actual->key << " -> " << actual->value;
                                          ~~~~~~~~^~~~~
In file included from c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\iostream:39:0,
                 from tp-8\Nave\cplusplus\map\Map.cpp:1:
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:628:5: note: candidate: std::basic_ostream<_CharT, _Traits>& std::operator<<(std::basic_ostream<_CharT, _Traits>&&, const _Tp&) [with _CharT = char; _Traits = std::char_traits<char>; _Tp = Value] <near match>
     operator<<(basic_ostream<_CharT, _Traits>&& __os, const _Tp& __x)
     ^~~~~~~~
c:\mingw\lib\gcc\mingw32\6.3.0\include\c++\ostream:628:5: note:   conversion of argument 1 would be ill-formed:
tp-8\Nave\cplusplus\map\Map.cpp:128:29: error: cannot bind 'std::basic_ostream<char>' lvalue to 'std::basic_ostream<char>&&'
         cout << actual->key << " -> " << actual->value;
         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
tp-8\Nave\cplusplus\map\Map.cpp: In function 'int testMap()':
tp-8\Nave\cplusplus\map\Map.cpp:147:25: error: could not convert '(const char*)"1"' from 'const char*' to 'Value'
     assocM("uno", "1", m);
                         ^
tp-8\Nave\cplusplus\map\Map.cpp:152:25: error: could not convert '(const char*)"2"' from 'const char*' to 'Value'
     assocM("dos", "2", m);
                         ^
tp-8\Nave\cplusplus\map\Map.cpp:157:26: error: could not convert '(const char*)"3"' from 'const char*' to 'Value'
     assocM("tres", "3", m);
                          ^
tp-8\Nave\cplusplus\map\Map.cpp:165:26: error: could not convert '(const char*)"10"' from 'const char*' to 'Value'
     assocM("uno", "10", m);
                          ^
tp-8\Nave\cplusplus\map\Map.cpp:170:23: error: conversion from 'std::__cxx11::string* {aka std::__cxx11::basic_string<char>*}' to non-scalar type 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}' requested
     string keys = domM(m);
                   ~~~~^~~
tp-8\Nave\cplusplus\nave\Nave.cpp: In function 'NaveSt* construir(SectorId)':
tp-8\Nave\cplusplus\nave\Nave.cpp:14:5: error: 'tripulantes' was not declared in this scope
     tripulantes = emptyM();
     ^~~~~~~~~~~
tp-8\Nave\cplusplus\nave\Nave.cpp:15:5: error: 'sectores' was not declared in this scope
     sectores = emptyM();
     ^~~~~~~~
tp-8\Nave\cplusplus\nave\Nave.cpp:16:5: error: 'OrdRangoTripulantes' was not declared in this scope
     OrdRangoTripulantes = emptyH();
     ^~~~~~~~~~~~~~~~~~~
tp-8\Nave\cplusplus\nave\Nave.cpp: At global scope:
tp-8\Nave\cplusplus\nave\Nave.cpp:25:40: error: conflicting declaration 'NaveSt* n'
 void ingresarT(Nombre n, Rango r, Nave n){
                                        ^
tp-8\Nave\cplusplus\nave\Nave.cpp:25:23: note: previous declaration as 'Nombre n'
 void ingresarT(Nombre n, Rango r, Nave n){
                       ^
tp-8\Nave\cplusplus\nave\Nave.cpp: In function 'void ingresarT(Nombre, Rango)':
tp-8\Nave\cplusplus\nave\Nave.cpp:27:19: error: base operand of '->' has non-pointer type 'Nombre {aka std::__cxx11::basic_string<char>}'
     assocM(n, t, n->tripulantes);
                   ^~
tp-8\Nave\cplusplus\nave\Nave.cpp:28:17: error: base operand of '->' has non-pointer type 'Nombre {aka std::__cxx11::basic_string<char>}'
     insertH(t, n->OrdRangoTripulantes);
                 ^~
tp-8\Nave\cplusplus\nave\Nave.cpp: At global scope:
tp-8\Nave\cplusplus\nave\Nave.cpp:32:39: error: conflicting declaration 'NaveSt* n'
 Set sectoresAsignados (Nombre n, Nave n){
                                       ^
tp-8\Nave\cplusplus\nave\Nave.cpp:32:31: note: previous declaration as 'Nombre n'
 Set sectoresAsignados (Nombre n, Nave n){
                               ^
tp-8\Nave\cplusplus\nave\Nave.cpp: In function 'SetSt* sectoresAsignados(Nombre)':
tp-8\Nave\cplusplus\nave\Nave.cpp:33:32: error: base operand of '->' has non-pointer type 'Nombre {aka std::__cxx11::basic_string<char>}'
     Tripulante t = lookupM(n, n->tripulantes);
                                ^~
tp-8\Nave\cplusplus\nave\Nave.cpp: In function 'std::pair<SetSt*, Componente*> datosDeSector(SectorId, Nave)':
tp-8\Nave\cplusplus\nave\Nave.cpp:43:40: error: cannot convert 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}' to 'Sector {aka SectorSt*}' in initialization
     Sector s = lookupM(sId, n->sectores);
                                        ^
tp-8\Nave\cplusplus\nave\Nave.cpp:45:37: error: 'sectoresC' was not declared in this scope
         return make_pair(sectoresC(s), componentesC(s));
                                     ^
tp-8\Nave\cplusplus\nave\Nave.cpp:45:54: error: 'componentesC' was not declared in this scope
         return make_pair(sectoresC(s), componentesC(s));
                                                      ^
tp-8\Nave\cplusplus\nave\Nave.cpp: In function 'TripulanteSt** tripulantesN(Nave, int)':
tp-8\Nave\cplusplus\nave\Nave.cpp:53:11: error: expected unqualified-id before '[' token
     string[cant] keys = domM(n->tripulantes);
           ^
tp-8\Nave\cplusplus\nave\Nave.cpp:56:9: error: 'keys' was not declared in this scope
         keys[i]= lookupM(n->tripulantes[i], n->tripulantes);
         ^~~~
tp-8\Nave\cplusplus\nave\Nave.cpp:56:42: error: could not convert '*(n->NaveSt::tripulantes + ((sizetype)(((unsigned int)i) * 8u)))' from 'MapSt' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
         keys[i]= lookupM(n->tripulantes[i], n->tripulantes);
                          ~~~~~~~~~~~~~~~~^
tp-8\Nave\cplusplus\nave\Nave.cpp:59:12: error: 'keys' was not declared in this scope
     return keys;
            ^~~~
tp-8\Nave\cplusplus\nave\Nave.cpp: At global scope:
tp-8\Nave\cplusplus\nave\Nave.cpp:63:22: error: variable or field 'agregarASector' declared void
 void agregarASector (Componentes* cs, int cant, SectorId sId, Nave n){
                      ^~~~~~~~~~~
tp-8\Nave\cplusplus\nave\Nave.cpp:63:22: error: 'Componentes' was not declared in this scope
tp-8\Nave\cplusplus\nave\Nave.cpp:63:35: error: 'cs' was not declared in this scope
 void agregarASector (Componentes* cs, int cant, SectorId sId, Nave n){
                                   ^~
tp-8\Nave\cplusplus\nave\Nave.cpp:63:39: error: expected primary-expression before 'int'
 void agregarASector (Componentes* cs, int cant, SectorId sId, Nave n){
                                       ^~~
tp-8\Nave\cplusplus\nave\Nave.cpp:63:58: error: expected primary-expression before 'sId'
 void agregarASector (Componentes* cs, int cant, SectorId sId, Nave n){
                                                          ^~~
tp-8\Nave\cplusplus\nave\Nave.cpp:63:68: error: expected primary-expression before 'n'
 void agregarASector (Componentes* cs, int cant, SectorId sId, Nave n){
                                                                    ^
tp-8\Nave\cplusplus\Sector\Sector.cpp: In function 'SectorSt* crearS(SectorId)':
tp-8\Nave\cplusplus\Sector\Sector.cpp:12:20: error: cannot convert 'SectorSt**' to 'Sector {aka SectorSt*}' in initialization
     Sector s = new Sector;
                    ^~~~~~
tp-8\Nave\cplusplus\Sector\Sector.cpp: In function 'void agregarC(Componente, Sector)':
tp-8\Nave\cplusplus\Sector\Sector.cpp:36:26: error: cannot convert 'Componente*' to 'Set {aka SetSt*}' in initialization
     Set componentes = s->componentes;
                          ^~~~~~~~~~~
tp-8\Nave\cplusplus\Sector\Sector.cpp:37:38: error: could not convert 'c' from 'Componente' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     componentes = addS(c, componentes);
                                      ^
tp-8\Nave\cplusplus\Sector\Sector.cpp:38:22: error: cannot convert 'Set {aka SetSt*}' to 'Componente*' in assignment
     s->componentes = componentes;
                      ^~~~~~~~~~~
tp-8\Nave\cplusplus\Sector\Sector.cpp: At global scope:
tp-8\Nave\cplusplus\Sector\Sector.cpp:42:16: error: variable or field 'agregarT' declared void
 void agregarT (Tripulant t, Sector s){
                ^~~~~~~~~
tp-8\Nave\cplusplus\Sector\Sector.cpp:42:16: error: 'Tripulant' was not declared in this scope
tp-8\Nave\cplusplus\Sector\Sector.cpp:42:36: error: expected primary-expression before 's'
 void agregarT (Tripulant t, Sector s){
                                    ^
tp-8\Nave\cplusplus\set\Set.cpp: In function 'int* setToList(Set)':
tp-8\Nave\cplusplus\set\Set.cpp:88:24: error: cannot convert 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}' to 'int' in assignment
         list[i] = acc->elem;
                        ^~~~
tp-8\Nave\cplusplus\set\Set.cpp: In function 'int testSet()':
tp-8\Nave\cplusplus\set\Set.cpp:132:14: error: could not convert '5' from 'int' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     addS(5, s);
              ^
tp-8\Nave\cplusplus\set\Set.cpp:133:15: error: could not convert '10' from 'int' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     addS(10, s);
               ^
tp-8\Nave\cplusplus\set\Set.cpp:134:14: error: could not convert '5' from 'int' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     addS(5, s); // Intento de agregar un elemento duplicado
              ^
tp-8\Nave\cplusplus\set\Set.cpp:135:15: error: could not convert '15' from 'int' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     addS(15, s);
               ^
tp-8\Nave\cplusplus\set\Set.cpp:139:65: error: could not convert '10' from 'int' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     std::cout << "Pertenece 10 al conjunto? " << (belongsS(10, s) ? "SÃ" : "No") << std::endl;
                                                                 ^
tp-8\Nave\cplusplus\set\Set.cpp:140:65: error: could not convert '20' from 'int' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     std::cout << "Pertenece 20 al conjunto? " << (belongsS(20, s) ? "SÃ" : "No") << std::endl;
                                                                 ^
tp-8\Nave\cplusplus\set\Set.cpp:143:18: error: could not convert '10' from 'int' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     RemoveS(10, s);
                  ^
tp-8\Nave\cplusplus\set\Set.cpp:163:16: error: could not convert '20' from 'int' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     addS(20, s2);
                ^
tp-8\Nave\cplusplus\set\Set.cpp:164:16: error: could not convert '30' from 'int' to 'std::__cxx11::string {aka std::__cxx11::basic_string<char>}'
     addS(30, s2);
                ^
tp-8\Nave\cplusplus\Tripulante\Tripulante.cpp: In function 'int testTripulante()':
tp-8\Nave\cplusplus\Tripulante\Tripulante.cpp:47:27: error: could not convert '1' from 'int' to 'SectorId {aka std::__cxx11::basic_string<char>}'
     asignarS(1, tripulante);
                           ^
tp-8\Nave\cplusplus\Tripulante\Tripulante.cpp:48:27: error: could not convert '2' from 'int' to 'SectorId {aka std::__cxx11::basic_string<char>}'
     asignarS(2, tripulante);
                           ^
tp-8\Nave\cplusplus\value\Value.cpp: In member function 'void Value::copiar(const Value&)':
tp-8\Nave\cplusplus\value\Value.cpp:19:44: error: 'otros' was not declared in this scope
         new (&datos.tripulante) Tripulante(otros.datos.tripulante);
                                            ^~~~~
tp-8\Nave\cplusplus\value\Value.cpp:21:36: error: 'otros' was not declared in this scope
         new (&datos.sector) Sector(otros.datos.sector);
                                    ^~~~~
tp-8\Nave\cplusplus\tp-8.exe : El módulo 'tp-8' no pudo cargarse. Para obtener más información, ejecute 'Import-Module tp-8'.
En línea: 1 Carácter: 391
+ ... cpp tp-8\Nave\cplusplus\value\Value.cpp; tp-8\Nave\cplusplus\tp-8.exe
+                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (tp-8\Nave\cplusplus\tp-8.exe:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CouldNotAutoLoadModule
 