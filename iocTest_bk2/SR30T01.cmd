#!../../bin/linux-x86_64/modbusApp

<envPaths

dbLoadDatabase("../../dbd/modbus.dbd")

modbus_registerRecordDeviceDriver(pdbbase)

drvAsynIPPortConfigure("SR30T01","164.54.160.158:502",0,0,1)

asynSetOption("SR30T01",0, "disconnectOnReadTimeout", "Y")

modbusInterposeConfig("SR30T01",0,2000,0)

drvModbusAsynConfigure("SR01AX01",  "SR30T01", 0, 4, 01, 010,    0,  100, "SR30T")
drvModbusAsynConfigure("SR01AX02",  "SR30T01", 0, 4, 11, 010,    0,  100, "SR30T")
drvModbusAsynConfigure("SR01AX03",  "SR30T01", 0, 4, 21, 010,    0,  100, "SR30T")
drvModbusAsynConfigure("SR01AX04",  "SR30T01", 0, 4, 31, 010,    0,  100, "SR30T")
drvModbusAsynConfigure("SR01AX05",  "SR30T01", 0, 4, 41, 010,    0,  100, "SR30T")
drvModbusAsynConfigure("SR01AX06",  "SR30T01", 0, 4, 51, 001,    0,  100, "SR30T")
drvModbusAsynConfigure("SR01AY01",  "SR30T01", 0, 6, 10, 041,    0,  100, "SR30T")


# Enable ASYN_TRACEIO_HEX on octet server
asynSetTraceIOMask("SR30T01",0,4)
# Enable ASYN_TRACE_ERROR and ASYN_TRACEIO_DRIVER on octet server
#asynSetTraceMask("Koyo1",0,9)

# Enable ASYN_TRACEIO_HEX on modbus server
asynSetTraceIOMask("SR01AY01",0,4)

asynSetTraceIOTruncateSize("SR01AY01",0,512)

dbLoadTemplate("SR30T01.substitutions")

iocInit
