void ClearString(char* curString, int bufferLen);
int GetStringLength(char* str);
void CopyStringToBuffer(char* dest, char* src);
void WriteIntToString(int number, char* dest, int &startPoint);
void CopyStringToBufferAtPos(char* dest, char* src, int &startPoint);
int ParseIntFromSubString(char* str, int start, int end);
void CopySubstringToBuffer(char* dest, char* src, int start, int end);