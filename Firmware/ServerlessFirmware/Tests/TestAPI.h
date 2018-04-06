#include "../Heep_API.h"
#include "UnitTestSystem.h"

void TestSchedulerRolloverProtection()
{
	std::string TestName = "Test Scheduler Overflow Protection";

	ScheduleTask(1);
	ScheduleTask(2);

	// Create largest possible Long minus a few
	simMillis =  ( (unsigned long)-1 ) - 100;

	unsigned char firstTakTime = IsTaskTime();
	unsigned long startingValue = simMillis;
	unsigned long firstLastMillis = lastMillis;

	for (int i = 0; i < 100; i++)
	{
		IsTaskTime();
	}

	unsigned long overFlowedLastMillis = lastMillis;

	ExpectedValue valueList [3];
	valueList[0].valueName = "Before Overflow Times";
	valueList[0].expectedValue = startingValue;
	valueList[0].actualValue = firstLastMillis;

	valueList[1].valueName = "Initial Task Time";
	valueList[1].expectedValue = 1;
	valueList[1].actualValue = firstTakTime;

	valueList[2].valueName = "Overflowed last millis";
	valueList[2].expectedValue = 0;
	valueList[2].actualValue = overFlowedLastMillis;

	CheckResults(TestName, valueList, 3);
}

void TestBufferControlType()
{
	std::string TestName = "Test Buffer Control Type";

	heepByte bufferControl [10];
	Control theControl;
	theControl.highValue = 10;
	theControl.controlBuffer = bufferControl;

	for(int i = 0; i < theControl.highValue; i++)
	{
		theControl.controlBuffer[i] = i;
	}

	ExpectedValue valueList [10];

	for(int i = 0; i < 10; i++)
	{
		valueList[i].valueName = std::string("Value at position ") + std::to_string(i);
		valueList[i].expectedValue = i;
		valueList[i].actualValue = theControl.controlBuffer[i];
	}

	CheckResults(TestName, valueList, 10);
}

void TestAnalyticsMillisecondsBytes()
{
#ifdef USE_ANALYTICS

	std::string TestName = "Test Analytics Time Keeping";

	simMillis = 200;
	int numBytesShouldBe1 = GetNumBytes64Bit(GetAnalyticsTime());
	simMillis = 400;
	int numBytesShouldBe2 = GetNumBytes64Bit(GetAnalyticsTime());
	simMillis =  1125899906842624;
	int numBytesShouldBe7 = GetNumBytes64Bit(GetAnalyticsTime());

	ExpectedValue valueList [3];
	valueList[0].valueName = "One Byte Number";
	valueList[0].expectedValue = 1;
	valueList[0].actualValue = numBytesShouldBe1;

	valueList[1].valueName = "Two Byte Number";
	valueList[1].expectedValue = 2;
	valueList[1].actualValue = numBytesShouldBe2;

	valueList[2].valueName = "Seven Byte Number";
	valueList[2].expectedValue = 7;
	valueList[2].actualValue = numBytesShouldBe7;

	CheckResults(TestName, valueList, 3);

#endif
}

void TestAddBufferToBuffer64Bit()
{
	std::string TestName = "Test Add Buffer to Buffer 64 Bit";

	heepByte myBuffer[20];
	simMillis =  0x01020304050607;

	unsigned long counter = 0;

	counter = AddNumberToBufferWithSpecifiedBytes64Bit(myBuffer, simMillis, counter, GetNumBytes64Bit(GetAnalyticsTime()));

	ExpectedValue valueList [8];
	valueList[0].valueName = "Counter";
	valueList[0].expectedValue = 7;
	valueList[0].actualValue = counter;

	for(int i = 1; i < 8; i++)
	{
		valueList[i].valueName = std::string("Byte ") + std::to_string(i);
		valueList[i].expectedValue = i;
		valueList[i].actualValue = myBuffer[i-1];
	}

	CheckResults(TestName, valueList, 8);
}

void TestCaptureAnalyticsToggle()
{
#ifdef USE_ANALYTICS

	std::string TestName = "Test Capture Analytics Toggle";

	ClearDeviceMemory();

	simMillis = 1;

	AddOnOffControl("Hello", HEEP_OUTPUT, 0);

	int firstAnalyticsPointer = GetNextAnalyticsDataPointer(0);

	SendOutputByID(0,1);

	int afterAddingAnalyticsPointer = GetNextAnalyticsDataPointer(0);

	SendOutputByIDNoAnalytics(0, 0);

	int afterNoAnalyticsAdd = GetNextAnalyticsDataPointer(SkipOpCode(GetNextAnalyticsDataPointer(0)));

#ifdef USE_INDEXED_IDS
	int expectedAfterAddingPointer = SkipOpCode(0);
#else
	int expectedAfterAddingPointer = 0;
#endif

	SendOutputByID(0,0);

	int afterSecondAnalyticsAdded = GetNextAnalyticsDataPointer(SkipOpCode(GetNextAnalyticsDataPointer(0)));

#ifdef USE_INDEXED_IDS
	int expectedAfterSecondAddingPointer = SkipOpCode(SkipOpCode(0));
#else
	int expectedAfterSecondAddingPointer = SkipOpCode(0);
#endif

	ExpectedValue valueList [4];
	valueList[0].valueName = "Before Analytics Added";
	valueList[0].expectedValue = -1;
	valueList[0].actualValue = firstAnalyticsPointer;

	valueList[1].valueName = "After Analytics Added";
	valueList[1].expectedValue = expectedAfterAddingPointer;
	valueList[1].actualValue = afterAddingAnalyticsPointer;

	valueList[2].valueName = "After No Analytics Added";
	valueList[2].expectedValue = -1;
	valueList[2].actualValue = afterNoAnalyticsAdd;

	valueList[3].valueName = "After Second Analytics Added";
	valueList[3].expectedValue = expectedAfterSecondAddingPointer;
	valueList[3].actualValue = afterSecondAnalyticsAdded;

	CheckResults(TestName, valueList, 4);

#endif
}

#ifdef USE_ANALYTICS
std::string base64_encode(unsigned char const* bytes_to_encode, unsigned int in_len) {
  std::string ret;
  int i = 0;
  int j = 0;
  unsigned char char_array_3[3];
  unsigned char char_array_4[4];

  while (in_len--) {
    char_array_3[i++] = *(bytes_to_encode++);
    if (i == 3) {
      char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
      char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
      char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
      char_array_4[3] = char_array_3[2] & 0x3f;

      for(i = 0; (i <4) ; i++)
        ret += base64_chars[char_array_4[i]];
      i = 0;
    }
  }

  if (i)
  {
    for(j = i; j < 3; j++)
      char_array_3[j] = '\0';

    char_array_4[0] = ( char_array_3[0] & 0xfc) >> 2;
    char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
    char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);

    for (j = 0; (j < i + 1); j++)
      ret += base64_chars[char_array_4[j]];

    while((i++ < 3))
      ret += '=';

  }

  return ret;

}
#endif

void TestBase64Encode()
{
#ifdef USE_ANALYTICS
	std::string TestName = "Test Base64 Encode";

	heepByte deviceID1[STANDARD_ID_SIZE];
	deviceID1 [0] = 0x94;
	deviceID1 [1] = 0xb0;
	deviceID1 [2] = 0xe3;
	deviceID1 [3] = 0x30;
	std::string base64String = base64_encode(deviceID1, STANDARD_ID_SIZE);
	base64_encode_Heep(deviceID1);

	ExpectedValue valueList [STANDARD_ID_SIZE_BASE_64];

	for(int i = 0; i < STANDARD_ID_SIZE_BASE_64; i++)
	{
		valueList[i].valueName = "Before Analytics Added";
		valueList[i].expectedValue = base64String[i];
		valueList[i].actualValue = base64DeviceIDByte[i];
	}

	CheckResults(TestName, valueList, STANDARD_ID_SIZE_BASE_64);
#endif
}

void TestHeepAPI()
{
	TestSchedulerRolloverProtection();
	TestBufferControlType();
	TestAnalyticsMillisecondsBytes();
	TestAddBufferToBuffer64Bit();
	TestCaptureAnalyticsToggle();
	TestBase64Encode();
}