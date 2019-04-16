/*******************************************************************
**
MIT License

Copyright (c) 2019 Dark Overlord of Data

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
******************************************************************/
#pragma once
#ifndef _OFLog_H_
#define _OFLog_H_

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#import <ObjFW/ObjFW.h>

#ifndef nullptr
#define nullptr NULL
#endif


#define overload __attribute__((overloadable))

static inline void OFLogv(OFString* format, va_list args)
{
    OFString * string = [[[OFString alloc] initWithFormat: format arguments:args] autorelease];
    fprintf(stderr, "%s\n", [string UTF8String]); 
}

/**
 * OFLog
 * 
 * Writes formatted output to stderr, with end of line.
 *
 */
overload static inline void OFLog (OFString* format, ...) 
{
    va_list args;
    va_start(args, format);
    OFLogv(format, args);    
    va_end(args);
}

__attribute__((__format__ (__printf__, 1, 2)))
overload static inline void OFLog (char* format, ...) 
{
    va_list args;
    va_start(args, format);
    OFString * of_format = [[[OFString alloc] initWithUTF8String:format] autorelease];
    OFLogv(of_format, args);    
    va_end(args);

}

#endif _OFLog_H_ 
