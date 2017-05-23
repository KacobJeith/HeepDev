rm TestFirmwareIndexed.app
rm TestFirmwareUnIndexed.app

make all

echo " "
echo " "
echo " "
echo " "
echo "Run UnIndexed Code"
echo " "
./TestFirmwareUnIndexed.app

echo " "
echo " "
echo " "
echo " "
echo "Run Indexed Code"
echo " "
./TestFirmwareIndexing.app