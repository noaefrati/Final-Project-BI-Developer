

**ONLY CLOTHING חברת–איפיון מסמך**

**:החברה תיאור**

,חנויות 50-כ ישנם .ב"ארה ברחבי הפרוסה בגדים חנויות של חברה הינה ONLY CLOTHING חברת

המכירות לכיוון בעתיד התפתחות תהיה כי וייתכן ,פיזיות חנויות הן כרגע החנויות .עובדים 1000-וכ

.באונליין

.וילדים גברים ,נשים בגדי הם החברה של המכירות עיקר

**:המערכת תיאור**

מעניקה המערכת ,בנוסף .ONLY CLOTHING החברה של הוצאות מול הכנסות חישובי תציג המערכת

.ומוכרים מוצרים ,קטגוריות ,שונים זמן צירי פני על ניתוח ובנוסף גיאוגרפית ברמה ניתוח

**:המערכת מטרת**

של העסקי המודל את לשפר ניתן בו האופן לגבי עסקיות תובנות והפקת החברה של המכירות ניתוח

.שונים מדדים באמצעות החברה





**:המערכת יעדי**

במערכת המצויים הנתונים מקורות על מורכבים אנליטיים ניתוחים לבצע שמטרתו DWH בניית

FACT וטבלת DIMENSION טבלאות יצירת כוללת DWH-ה בניית .PRIORITY ERP של התפעולית

.החברה נתוני לגביי שונים חיתוכים עם רלוונטים דוחות יצירת ,בנוסף .אחת

**:DWH הטבלאות פירוט**

.בחברה הסוכנים כל פרטי את השומרת טבלה :DimAgents

.זמן טבלת :DimDate

.החברה מוצרי של השונות האב קטגוריות פרטי כל את השומרת טבלה :DimCategories

של השונות )הבנים קטגוריות( הקטגוריות תת פרטי כל את השומרת טבלה :DimSubCategories

.החברה מוצרי

.השונות המדינות פרטי את השומרת טבלה :DimCountries

.החברה של הלקוחות פרטי כל את השומרת טבלה :DimCustomers

.בחברה שקיימים השונים המוצרים פרטי כל את השומרת טבלה :DimProducts

.החברה של השונות החנויות פרטי כל את השומרת טבלה :DimStores

.שהתבצעו המכירות ובפרטי במכירות הקשורים הגורמים כל את בתוכה המאגדת טבלה :FactSales

**:בשימוש טכנולוגיות**

.MSSQL שרת על ונמצא Priority לחברת שייך הנתונים מסד .1

תוך אינקרימנטלית טעינה תתבצע זה בתהליך .SSIS-ה תוכנת י"ע ETL-ה תהליך מימוש .2

,DWH -ה שבתוך היעד טבלאות אל טעינה ולבסוף STG טבלאות ,MRR בטבלאות שימוש

.MSSQL שרת על הנמצאות

יצירת .החברה של DWH-ה על POWER BI תוכנת י"ע דוחות והפקת אנלטיים ניתוחים .3

.החברה נתוני על ותובנות חישובים להפיק מנת על DAX בשפת מדדים

**:נתונים מקורות**

.MSSQL שרת על שנמצא Priority חברת של ERP הנתונים ממסד מגיעות הטבלאות רוב

.MSSQL שרת על המורץ סקריפט י"ע נוצרה DimDate טבלת

הרצת וכן Priority חברת של ERD הנתונים מסד על פרוצדורה הרצת י"ע CDC טבלאות יצירת

.האינקרימנטלית הטעינה את לבצע נרצה שעליהן הטבלאות כל על נוספת פרוצדורה





**:ETL-ה תהליך**

כל של היסטורית טעינה היא הראשון החלק מטרת כאשר ,חלקים לארבעה מתחלק התהליך

.DWH-ה אל וטעינתם התפעולית במערכת המצויים הנתונים

אחריו ,Mark CDC Start סימון לאחר מתחיל התהליך .ETLה תהליך את מתארים החלקים שאר

.האינקרימנלטית הטעינה תתחיל

נעשה הנתונים חילוץ .PRIORITYERP הנתונים שבמסד המקור מטבלאות הנתונים חילוץ .1

.טבלה כל עבור שנוצרו CDC-ה טבלאות אלה המקור טבלאות כאשר ,אינקרימנטלי באופן

להוות שתפקידן .MRR-ה טבלאות אל נטענים השינויים את לראות נרצה ,טעינה באותה

של החדש הזמן הטווח את נסמן החילוץ שלב בסוף טעינה באותה השינויים של שיקוף

.האינקרימנטלית הטעינה

.MRR-ה טבלאות מתוך המגיעים הנתונים על טרנספורמציות נבצע ,מכן לאחר .2

השדות של הנתונים טיפוסי את נעדכן •

DWH-שב שבטבלאות הסופיים השמות אל השדות שמות את נעדכן •

נאפיין וכן INVOICEITEMS\_MRR עם יחד INVOICES\_MRR :הבאות הטבלאות את נמזג •

לבצע היא המטרה .זו טעינה של הזמן בחלון שקרו השונות DML-ה פקודות סוגי את

.DWH-ב FACT-ה טבלת אל הסופית הטעינה לקראת הנתונים של הכנה

.STG-ה טבלאות הן והיעד MRR-ה טבלאות הן שלנו הנתונים מקור זה בשלב

-ה וטבלת DIM -ה טבלאות הן אלו ,DWH-ב היעד טבלאות אל טעינה נבצע האחרון בשלב .3

.FACT

שתועדו השונות DML-ה פקודות לפי מתאים מענה והענקת בדיקה תעשה זה בשלב

.CDC-ה בטבלאות

ב שימוש – אינקרימנטלית טעינה של נוסף בסוג שימוש גם נעשה ,CDC בטבלאות השימוש מלבד

.SCD TYPE 2 הוא שנבחר הסוג ,DimAgents טבלת על SCD

SCD TYPE 2 .EndDate -ו StartDate :נוספים שדות שני DimAgents לטבלת הוספנו כך לצורך

ישנו אז DELETE או UPDATE מסוג DML פקודת מתבצעת כאשר א"ז ,היסטורית בשמירה מטפל

מחדל כברירת .הרשומה על השינוי התרחש שבו הסיום תאריך שמירת באמצעות השינוי של תיעוד

ביותר הרלוונטית הרשומה היא ל"הנ הרשומה כי כך על מעיד זה ובאופן NULL הוא הסיום תאריך

.SSIS-ה ממערכת התקבל StartDate של הערך )שינויים הרשומה על התרחשו לא עוד כל(

**:המערכת תזמון**

ללא רציפה עבודה להעניק רצון תוך )00:00( הלילה בשעות יום בכל לרוץ מתוזמן ETL-ה תהליך

את לבצע שתפקידו SQL AGENT -ב JOB -כ הוגדר זה תהליך .השונים הקצה למשתמשי הפרעות

.מראש שהוגדרו הזמן בקפיצות התהליך





:PriorityERP הנתונים מסד של ERD סכמת





:Source To Target

Database

MRR

STG

DWH

AGENTS.ADDRESS

AGENTS.AGENT

STG\_DimAgents.Address

STG\_DimAgents.AgentID

STG\_DimAgents.AgentName

DimAgents.Address

DimAgents.AgentID

DimAgents.AgentName

AGENTS.AGENTNA

ME

AGENTS.COMMISSI

ON

STG\_DimAgents.Commission

DimAgents.Commission

AGENTS.EMAIL

STG\_DimAgents.Email

STG\_DimAgents.Phone

STG\_DimAgents.CountryID

STG\_DimAgents.State

STG\_DimAgents.StoreID

DimAgents.Email

AGENTS.PHONE

AGENTS.COUNTRY

AGENTS.STATE

DimAgents.Phone

DimAgents.CountryID

DimAgents.State

AGENT.BRANCH

DimAgents.StoreID

DimAgents.StartDate

DimAgents.EndDate

FactSales.CountryID

FactSales.StoreID

BRANCHES.BRANCH MRR\_ BRANCHES.BRANCH

STG\_DimStores.StoreID

STG\_DimStores.Phone

STG\_DimStores.Address

STG\_DimStores.State

DimStores.StoreID

DimStores.Phone

DimStores.Address

DimStores.State

BRANCHES.PHONE

BRACHES.ADDRESS

BRANCHES.STATE

MRR\_ BRANCHES.PHONE

MRR\_ BRACHES.ADDRESS

MRR\_ BRANCHES.STATE

BRANCHES.COUNTR MRR\_ BRANCHES.COUNTRY

Y

STG\_DimStores.CountryID

DimStores.CountryID

BRANCHES.CITY

MRR\_ BRANCHES.CITY

STG\_DimStores.City

DimStores.City

COUNTRIES.COUNT

RY

MRR\_ COUNTRIES.COUNTRY

STG\_DimCountries.CountryID

DimCountries.CountryID

COUNTRY.COUNTRY MRR\_ COUNTRY.COUNTRYNAME STG\_DimCountries.CountryName

NAME

DimCountries.CountryName

CUSTOMERS.ADDRE MRR\_CUSTOMERS.ADDRESS

STG\_DimCustomers.Address

DimCustomers.Address

SS

CUSTOMERS.AGENT MRR\_CUSTOMERS.AGENT

STG\_DimCustomers.AgentID

STG\_DimCustomers.CountryID

DimCustomers.AgentID

DimCustomers.CountryID

CUSTOMERS.COUNT MRR\_CUSTOMERS.COUNTRY

RY

CUSTOMERS.CUST

MRR\_CUSTOMERS.CUST

STG\_DimCustomers.CustomerID

DimCustomers.CustomerID

CUSTOMERS.CUSTN MRR\_CUSTOMERS.CUSTNAME

AME

STG\_DimCustomers.CustomerName

DimCustomers.CustomerName

CUSTOMERS.PHONE MRR\_CUSTOMERS.PHONE

STG\_DimCustomers.Phone

STG\_DimCustomers.State

DimCustomers.Phone

DimCustomers.State

CUSTOMERS.STATE

MRR\_ CUSTOMERS.STATE





FAMILY.FAMILY

MRR\_FAMILY.FAMILY

STG\_DimSubCategory.SubCategoryID

DimSubCategory.SubCategoryID

FAMILY.FAMILYNA MRR\_FAMILY.FAMILYNAME

ME

STG\_DimSubCategory.SubCategoryNa DimSubCategory.SubCategory

me

Name

FAMILY.FAMILYTY MRR\_FAMILY.FAMILYTYPE

PE

STG\_DimSubCategory.CategoryID

DimSubCategory.CategoryID

FAMILYTYPES.FA

MILYTYPE

MRR\_FAMILYTYPES.FAMILYTY STG\_DimCategory.CategoryID

PE

DimCategory.CategoryID

FAMILYTYPES.FTN MRR\_FAMILYTYPES.FTNAME

AME

STG\_DimCategory.CategoryName

DimCategory.CategoryName

INVOICEITEMS.CO MRR\_INVOICEITEMS.COUNTR STG\_FactSales.CountryID

FactSales.CountryID

UNTRY

Y

INVOICEITEMS.IV

MRR\_INVOICEITEMS.IV

STG\_FactSales.InvoiceID

STG\_INVOICEITEMS.KLINE

FactSales.InvoiceID

FactSales.Kline

INVOICEITEMS.KLI MRR\_INVOICEITEMS.KLINE

NE

INVOICEITEMS.PA MRR\_INVOICEITEMS.PART

RT

INVOICEITEMS.PRI MRR\_ INVOICEITEMS.PRICE

CE

STG\_FactSales.ProductID

STG\_FactSales.Price

FactSales.ProductID

FactSales.Price

INVOICEITEMS.QU MRR\_ INVOICEITEMS.QUANT STG\_FactSales.Quantity

ANT

FactSales.Quantity

INVOICES.AGENT

INVOICES.CUST

MRR\_ INVOICES.AGENT

MRR\_ INVOICES.CUST

STG\_FactSales.AgentID

STG\_FactSales.CustomerID

STG\_FactSales.Discount

FactSales.AgentID

FactSales.CustomerID

FactSales.Discount

INVOICES.DISCOU MRR\_ INVOICES.DISCOUNT

NT

INVOICES.IV

MRR\_ INVOICES.IV

STG\_FactSales.InvoiceID

FactSales.InvoiceID

INVOICES.IVDATE

MRR\_ INVOICES.IVDATE

STG\_FactSales.InvoiceDate

FactSales.InvoiceDate

PART.COST

MRR\_ PART.COST

MRR\_ PART.FAMILY

MRR\_ PART.PART

MRR\_ PART.PARTNAME

MRR\_ PART.PRICE

MRR\_ PART.STATUS

MRR\_ PART.UNIT

STG\_DimProducts.Cost

DimProducts.Cost

PART.FAMILY

PART.PART

STG\_DimProducts.SubCategoryID

STG\_DimProducts.ProductID

STG\_DimProducts.ProductName

STG\_DimProducts.Price

DimProducts.SubCategoryID

DimProducts.ProductID

DimProducts.ProductName

DimProducts.Price

PART.PARTNAME

PART.PRICE

PART.STATUS

PART.UNIT

STG\_DimProducts.Status

DimProducts.Status

STG\_DimProducts.UnitsInStock

DimProducts.UnitsInStock





:DWH ERD





**:POWER BI המערכת מסכי**

כמויות ,רווחים ,המכירות של אחרון השבוע את מתאר הלוח **:Daily Sales Dashboard .1**

,מכירות כ"מסה רווח אחוז ,רווח כ"סה ,הוצאות כ"סה ,מכירות כ"סה : KPIב שימוש .ועלויות

בתקופה מכירות בין השוואה גרף .המוגדר הזמן חתך לפי כמויות כ"וסה עלות כ"סה

. יומי בחיתוך שעברה בשנה המוגדרת התקופה מול השנה המוגדרת





כ"סה של ברמה State כל לגבי פירוט עם ,השונים Statesה של תצוגה **:GEO Analysi**s **.2**

States של בחתך מכירות גרף .הזמנות כ"סה ,רווח כ"בה ,שהוזמנו פריטים כ"סה ,מכירות

מפה .State כל עבור הזמנות סכום כ"סה ,פריטים כ"סה המציד גרף ,שעברה שנה לעומת

את המציג פאי גרף .ב"בארה השונות המדינות בין המכירות ריכוז את המתארת גיאוגרפית

.State כל עבור שנקנו הפרטים אחוז





כ"סה את המציג גרף ישנו .סינון אפשרויות עם ,האחרון השבוע של תצוגה **:Agent Analysis .3**

כ"סה של תצוגה – הזמן ממד עבור drill down לבצע אפשרות עם רווחים כ"וסה מכירות

ההזמנות אחוז את המתאר פאי גרף ישנו .בסינון שנקבע זמן פרק אותו לאורך ומכירות רווח

.ההזמנות כ"לסה ביחד עובד כל שביצע

העמודות עבור conditional formatting עם ,הסוכנים כל פרטי את המציגה טבלה ישנה

יצבע הערך של הרקע אז 500$-100$ בין הוא המכירות סך אם – Total Sales :הבאות

,בצהוב

בירוק יצבע הערך שך הרקע אז 1500$-500$ בין הוא המכירות סך אם

.באדום יצבע המכירות סך אז 100$ל מתחת הוא המכירות סך אם





אופציה עם אב קטגוריות לפי מחולקים רווחים .האחרון הזמן של תצוגה **:Product Analysis .4**

,השנה ברמת סינון אפשרויות ישנן בנוסף )tree map( קטגוריות תתי תוך אל drill down-ל

את ,מוכרים הכי המוצרים את המציגים גרים ישנם .בן וקטוגריית אב קטגוריית ,תאריך

בנוסף .נמכר פחות שהכי והמוצר נמכרת פחות שהכי הקטגוריה לצד נמכרות הכי הקטגוריות

הקטגוריות תתי פירוט עם ,האב קטגוריות דרך מעבר לעשות ניתן שדרכה טבלה ישנה

יחידות כ"סה ,מכירות כ"בה ,רווח כ"סה המציגות עמודות ישנן .קטגוריה לכל השייכות

.קטגוריה כל עבור עמלה כ"וסה שנמכרו





. STATE ,תאריך ,שנה של ומסננים KPI עם ,שנתיות תחזיות **:Yearly Trend .5**





**:Measures**

YTD Total Units = TOTALYTD([Total Units], 'DimDate'[Date])

YTD Sales = TOTALYTD([Total Sales], 'DimDate'[Date])

Total Commission = SUM(FactSales[Commission])

Total Cost = SUM(FactSales[TotalCost])

Total Discount = SUM(FactSales[DiscountCost])

Total Revenue = SUM(FactSales[Revenue])

Total Sales = SUM(FactSales[SalesAmount])

Total Units = SUM(FactSales[Quantity])

Total Units Var = [Total Units] - [LY Total Units]

Sales Var = [Total Sales] - [LY Sales]

Revenue % = [Total Revenue]/[Total Sales]

LY YTD Total Units = CALCULATE([YTD Total Units], SAMEPERIODLASTYEAR('DimDate'[Date]))

LY YTD Sales = CALCULATE([YTD Sales],SAMEPERIODLASTYEAR('DimDate'[Date]))

LY Total Units = CALCULATE([Total Units],SAMEPERIODLASTYEAR('DimDate'[Date]))

LY Total Sales = CALCULATE([Total Units], SAMEPERIODLASTYEAR('DimDate'[Date]))

LY Sales = CALCULATE([Total Sales],SAMEPERIODLASTYEAR('DimDate'[Date]))

LY Revenue = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR('DimDate'[Date]))

LY Discount = CALCULATE([Total Discount], SAMEPERIODLASTYEAR('DimDate'[Date]))

LY Cost = CALCULATE([Total Cost], SAMEPERIODLASTYEAR('DimDate'[Date]))

LY Commission = CALCULATE([Total Commission], SAMEPERIODLASTYEAR('DimDate'[Date]))

:**Calculated Columns**

Commission = RELATED(DimAgents[Commission]) \* FactSales[Revenue]

DiscountCost = FactSales[SalesAmount] \* FactSales[Discount]

Revenue = FactSales[SalesAmount]-FactSales[DiscountCost]-FactSales[TotalCost]

SalesAmount = (FactSales[Price] \* FactSales[Quantity])





TotalCost = FactSales[Cost] \* FactSales[Quantity]


