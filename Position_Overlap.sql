SELECT DISTINCT HAPF.POSITION_CODE "PositionCode"
	, TO_CHAR(HAPF.EFFECTIVE_START_DATE, 'YYYY/MM/DD') "EffectiveStartDate"
	, HOUFT.NAME "BusinessUnitName"
	, HAPF.OVERLAP_ALLOWED "OverlapAllowed"
FROM HR_ALL_POSITIONS_F HAPF
	, HR_ORGANIZATION_UNITS_F_TL HOUFT
	, HR_ORG_UNIT_CLASSIFICATIONS_F HOUCF
WHERE 1 = 1
	AND HAPF.BUSINESS_UNIT_ID = HOUFT.ORGANIZATION_ID
	AND HAPF.BUSINESS_UNIT_ID = HOUCF.ORGANIZATION_ID
	AND HOUCF.CLASSIFICATION_CODE = 'FUN_BUSINESS_UNIT'
	AND HAPF.POSITION_CODE IN ('24', '35', '11', '14', '19', '17', '51', '27', '32', '36')
