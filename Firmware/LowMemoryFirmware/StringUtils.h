#ifndef STRING_UTIL_DEF
#define STRING_UTIL_DEF

void ClearString(char* curString, int bufferLen);
int GetStringLength(char* str);
void CopyStringToBuffer(char* dest, char* src);
void WriteIntToString(int number, char* dest, int &startPoint);
void CopyStringToBufferAtPos(char* dest, char* src, int &startPoint);

#endif