SELECT DISTINCT PAPF.PERSON_NUMBER "PersonNumber"
	, TO_CHAR(PPLF.EFFECTIVE_START_DATE, 'YYYY/MM/DD') "EffectiveStartDate"
	, TO_CHAR(PPLF.EFFECTIVE_END_DATE, 'YYYY/MM/DD') "EffectiveEndDate"
	, PPLF.LEGISLATION_CODE	"LegislationCode"
	, PPLF.MARITAL_STATUS "MaritalStatus"
	, TO_CHAR(PPLF.MARITAL_STATUS_DATE, 'YYYY/MM/DD') "MaritalStatusDate"
	, PPLF.SEX "Sex"
	, HIKM.SOURCE_SYSTEM_ID "SourceSystemId"
	, HIKM.SOURCE_SYSTEM_OWNER "SourceSystemOwner"
FROM PER_PEOPLE_LEGISLATIVE_F PPLF
	, PER_ALL_PEOPLE_F PAPF
	, HRC_INTEGRATION_KEY_MAP HIKM
WHERE 1 = 1
	AND PPLF.PERSON_ID = PAPF.PERSON_ID
	AND PPLF.PERSON_LEGISLATIVE_ID = HIKM.SURROGATE_ID
	AND SYSDATE BETWEEN PPLF.EFFECTIVE_START_DATE AND PPLF.EFFECTIVE_END_DATE
	AND SYSDATE BETWEEN PAPF.EFFECTIVE_START_DATE AND PAPF.EFFECTIVE_END_DATE
	AND HIKM.OBJECT_NAME = 'PersonLegislativeInfo'
	AND PAPF.PERSON_NUMBER LIKE 'TEST%'
	AND HIKM.SOURCE_SYSTEM_OWNER NOT LIKE 'FUSION'
ORDER BY 1
