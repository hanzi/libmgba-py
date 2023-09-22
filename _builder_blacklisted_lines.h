// We are generating C definitions for CFFI by simply preprocessing all the header
// files in mGBA.
// But some functions are defined in the headers but not actually implemented by
// the library (due to build flags probably), which causes CFFI to throw errors.
//
// As a very crude solution, this just lists all the lines that might be problematic
// so that `_builder.py` can filter them out.
//
// Any line written here will be excluded from the C definitions.

typedef char* void*;

struct EReaderScan* EReaderScanCreate(unsigned width, unsigned height);
void EReaderScanDetectParams(struct EReaderScan*);
void EReaderScanDetectAnchors(struct EReaderScan*);
void EReaderScanFilterAnchors(struct EReaderScan*);
void EReaderScanConnectAnchors(struct EReaderScan*);
void EReaderScanCreateBlocks(struct EReaderScan*);
void EReaderScanDetectBlockThreshold(struct EReaderScan*, int block);
bool EReaderScanRecalibrateBlock(struct EReaderScan*, int block);
bool EReaderScanScanBlock(struct EReaderScan*, int block, bool strict);

void EReaderAnchorListInit(struct EReaderAnchorList* vector, size_t capacity);
void EReaderAnchorListDeinit(struct EReaderAnchorList* vector);
struct EReaderAnchor* EReaderAnchorListGetPointer(struct EReaderAnchorList* vector, size_t location);
struct EReaderAnchor const* EReaderAnchorListGetConstPointer(const struct EReaderAnchorList* vector, size_t location);
struct EReaderAnchor* EReaderAnchorListAppend(struct EReaderAnchorList* vector);
void EReaderAnchorListClear(struct EReaderAnchorList* vector);
void EReaderAnchorListResize(struct EReaderAnchorList* vector, ssize_t change);
void EReaderAnchorListShift(struct EReaderAnchorList* vector, size_t location, size_t difference);
void EReaderAnchorListUnshift(struct EReaderAnchorList* vector, size_t location, size_t difference);
void EReaderAnchorListEnsureCapacity(struct EReaderAnchorList* vector, size_t capacity);
size_t EReaderAnchorListSize(c7onst struct EReaderAnchorList* vector);
size_t EReaderAnchorListIndex(const struct EReaderAnchorList* vector, const struct EReaderAnchor* member);
void EReaderAnchorListCopy(struct EReaderAnchorList* dest, const struct EReaderAnchorList* src);
size_t EReaderAnchorListSize(const struct EReaderAnchorList* vector);

void EReaderBlockListInit(struct EReaderBlockList* vector, size_t capacity);
void EReaderBlockListDeinit(struct EReaderBlockList* vector);
struct EReaderBlock* EReaderBlockListGetPointer(struct EReaderBlockList* vector, size_t location);
struct EReaderBlock const* EReaderBlockListGetConstPointer(const struct EReaderBlockList* vector, size_t location);
struct EReaderBlock* EReaderBlockListAppend(struct EReaderBlockList* vector);
void EReaderBlockListClear(struct EReaderBlockList* vector);
void EReaderBlockListResize(struct EReaderBlockList* vector, ssize_t change);
void EReaderBlockListShift(struct EReaderBlockList* vector, size_t location, size_t difference);
void EReaderBlockListUnshift(struct EReaderBlockList* vector, size_t location, size_t difference);
void EReaderBlockListEnsureCapacity(struct EReaderBlockList* vector, size_t capacity);
size_t EReaderBlockListSize(const struct EReaderBlockList* vector);
size_t EReaderBlockListIndex(const struct EReaderBlockList* vector, const struct EReaderBlock* member);
void EReaderBlockListCopy(struct EReaderBlockList* dest, const struct EReaderBlockList* src);

extern const unsigned GBA_AUDIO_SAMPLES;
extern const int GBA_AUDIO_VOLUME_MAX;
extern const SM83Instruction _sm83InstructionTable[0x100];
extern const int GBSIOCyclesPerTransfer[2];
extern const int GBASIOCyclesPerTransfer[4][4];
extern const uint32_t DMG_SM83_FREQUENCY;
extern const uint32_t CGB_SM83_FREQUENCY;
extern const uint32_t SGB_SM83_FREQUENCY;
extern int _mLOG_CAT_GBA;
extern int _mLOG_CAT_GBA_DEBUG;
extern int _mLOG_CAT_GB_VIDEO;
extern int _mLOG_CAT_GBA_DMA;
extern int _mLOG_CAT_GBA_MEM;
extern int _mLOG_CAT_GB;
extern int _mLOG_CAT_GBA_VIDEO;
extern int _mLOG_CAT_GBA_SIO;
extern int _mLOG_CAT_GB_MBC;
extern int _mLOG_CAT_GB_MEM;
extern int _mLOG_CAT_GBA_HW;
extern int _mLOG_CAT_GB_SIO;
extern int _mLOG_CAT_GBA_SAVE;
extern int _mLOG_CAT_GBA_AUDIO;
extern int _mLOG_CAT_DEBUGGER;

extern const uint32_t DEBUGGER_ID;
extern  const struct mInputPlatformInfo GBAInputInfo;

extern const char* ERROR_MISSING_ARGS;
extern const char* ERROR_OVERFLOW;
extern const char* ERROR_INVALID_ARGS;
extern const char* INFO_BREAKPOINT_ADDED;
extern const char* INFO_WATCHPOINT_ADDED;
