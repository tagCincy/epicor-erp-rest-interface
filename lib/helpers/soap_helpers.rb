module SoapHelpers



	def company_id
		"APEX01"
	end

	def customer_service_wsdl
		"http://69.80.72.147/EpicorServices/CustomerService.asmx?WSDL"
	end

	def customer_contact_service_wsdl
		"http://69.80.72.147/EpicorServices/CustCntService.asmx?WSDL"
	end

	def get_by_id_message_body id
		{ "CompanyID" => "APEX01", "custNum" => id }
	end

	def new_customer_message
		{ "CompanyID" => "APEX01" }
	end

	def get_seconds_since_midnight hours
		@result = hours * 3600
	end


	def soap_client wsdl_url
		@client = Savon.client do
			wsdl wsdl_url
			wsse_auth("manager", "manager")
			pretty_print_xml true
			log_level :debug
			log false
			convert_request_keys_to :camelcase
			env_namespace :soap
			namespace_identifier nil
		end
	end

	def customer_contact_data_set
		@result ||= Nokogiri::XML("<CustCnt>
            <Company>APEX01</Company>
            <CustNum/>
            <ShipToNum/>
            <ConNum>0</ConNum>
            <Name/>
            <Func/>
            <FaxNum/>
            <PhoneNum/>
            <SpecialAddress>false</SpecialAddress>
            <Address1/>
            <Address2/>
            <Address3/>
            <City/>
            <State/>
            <Zip/>
            <Country/>
            <CorpName/>
            <EMailAddress/>
            <CountryNum>0</CountryNum>
            <SFPortalPassword/>
            <SFUser>false</SFUser>
            <PortalUser>false</PortalUser>
            <RoleCode/>
            <CellPhoneNum/>
            <PagerNum/>
            <HomeNum/>
            <AltNum/>
            <ContactTitle/>
            <ReportsTo/>
            <Comment/>
            <NoContact>false</NoContact>
            <CreateDate>2013-07-08T00:00:00-05:00</CreateDate>
            <CreateDcdUserID>manager</CreateDcdUserID>
            <ChangeDcdUserID/>
            <Inactive>false</Inactive>
            <Character01/>
            <Character02/>
            <Character03/>
            <Character04/>
            <Character05/>
            <Character06/>
            <Character07/>
            <Character08/>
            <Character09/>
            <Character10/>
            <Number01>0</Number01>
            <Number02>0</Number02>
            <Number03>0</Number03>
            <Number04>0</Number04>
            <Number05>0</Number05>
            <Number06>0</Number06>
            <Number07>0</Number07>
            <Number08>0</Number08>
            <Number09>0</Number09>
            <Number10>0</Number10>
            <CheckBox01>false</CheckBox01>
            <CheckBox02>false</CheckBox02>
            <CheckBox03>false</CheckBox03>
            <CheckBox04>false</CheckBox04>
            <CheckBox05>false</CheckBox05>
            <FirstName/>
            <MiddleName/>
            <LastName/>
            <Prefix/>
            <Suffix/>
            <Initials/>
            <ExternalID/>
            <GlobalLock>false</GlobalLock>
            <ShowInputPrice>false</ShowInputPrice>
            <Number11>0</Number11>
            <Number12>0</Number12>
            <Number13>0</Number13>
            <Number14>0</Number14>
            <Number15>0</Number15>
            <Number16>0</Number16>
            <Number17>0</Number17>
            <Number18>0</Number18>
            <Number19>0</Number19>
            <Number20>0</Number20>
            <CheckBox06>false</CheckBox06>
            <CheckBox07>false</CheckBox07>
            <CheckBox08>false</CheckBox08>
            <CheckBox09>false</CheckBox09>
            <CheckBox10>false</CheckBox10>
            <CheckBox11>false</CheckBox11>
            <CheckBox12>false</CheckBox12>
            <CheckBox13>false</CheckBox13>
            <CheckBox14>false</CheckBox14>
            <CheckBox15>false</CheckBox15>
            <CheckBox16>false</CheckBox16>
            <CheckBox17>false</CheckBox17>
            <CheckBox18>false</CheckBox18>
            <CheckBox19>false</CheckBox19>
            <CheckBox20>false</CheckBox20>
            <ShortChar01/>
            <ShortChar02/>
            <ShortChar03/>
            <ShortChar04/>
            <ShortChar05/>
            <ShortChar06/>
            <ShortChar07/>
            <ShortChar08/>
            <ShortChar09/>
            <ShortChar10/>
            <ChangeTime>0</ChangeTime>
            <ChangedBy/>
            <SysRowID/>
            <SysRevID>0</SysRevID>
            <BitFlag>0</BitFlag>
            <MasterCustNum>0</MasterCustNum>
            <MasterShipToNum/>
            <MasterConNum>0</MasterConNum>
            <PerConID>0</PerConID>
            <SyncNameToPerCon>true</SyncNameToPerCon>
            <SyncAddressToPerCon>true</SyncAddressToPerCon>
            <SyncPhoneToPerCon>true</SyncPhoneToPerCon>
            <SyncEmailToPerCon>true</SyncEmailToPerCon>
            <SyncLinksToPerCon>true</SyncLinksToPerCon>
            <WebSite/>
            <IM/>
            <Twitter/>
            <LinkedIn/>
            <FaceBook/>
            <WebLink1/>
            <WebLink2/>
            <WebLink3/>
            <WebLink4/>
            <WebLink5/>
            <PerConAddress>false</PerConAddress>
            <RoleDescription/>
            <PrimaryBilling>false</PrimaryBilling>
            <PrimaryPurchasing>false</PrimaryPurchasing>
            <PrimaryShipping>false</PrimaryShipping>
            <GlbFlag>false</GlbFlag>
            <AttrCodeList/>
            <GlbLink/>
            <ContactName/>
            <PerConName/>
            <CustNumCustID/>
            <CustNumName/>
            <CustNumBTName/>
            <MasterCustNumCustID/>
            <MasterCustNumName/>
            <MasterCustNumBTName/>
            <RowIdent/>
            <RowMod>A</RowMod>
          </CustCnt>")
	end

	def customer_data_set
		@result ||= Nokogiri::XML("<Customer>
            <Company>APEX01</Company>
            <CustID/>
            <CustNum>0</CustNum>
            <Name/>
            <Address1/>
            <Address2/>
            <Address3/>
            <City/>
            <State/>
            <Zip/>
            <Country>United States</Country>
            <ResaleID/>
            <SalesRepCode/>
            <TerritoryID/>
            <ShipToNum/>
            <TermsCode>DM10</TermsCode>
            <ShipViaCode/>
            <PrintStatements>false</PrintStatements>
            <PrintLabels>true</PrintLabels>
            <PrintAck>true</PrintAck>
            <FinCharges>true</FinCharges>
            <CreditHold>true</CreditHold>
            <GroupCode/>
            <DiscountPercent>0</DiscountPercent>
            <PrimPCon>0</PrimPCon>
            <PrimBCon>0</PrimBCon>
            <PrimSCon>0</PrimSCon>
            <Comment/>
            <EstDate>#{DateTime.now.to_s}</EstDate>
            <FaxNum/>
            <PhoneNum/>
            <TaxExempt/>
            <MarkUpID/>
            <BillDay>0</BillDay>
            <OneInvPerPS>true</OneInvPerPS>
            <DefaultFOB/>
            <CreditIncludeOrders>true</CreditIncludeOrders>
            <CreditHoldSource>MANUAL</CreditHoldSource>
            <CreditClearUserID/>
            <CreditClearTime/>
            <EDICode/>
            <Character01/>
            <Character02/>
            <Character03/>
            <Character04/>
            <Character05/>
            <Character06/>
            <Character07/>
            <Character08/>
            <Character09/>
            <Character10/>
            <Number01>0</Number01>
            <Number02>0</Number02>
            <Number03>0</Number03>
            <Number04>0</Number04>
            <Number05>0</Number05>
            <Number06>0</Number06>
            <Number07>0</Number07>
            <Number08>0</Number08>
            <Number09>0</Number09>
            <Number10>0</Number10>
            <CheckBox01>false</CheckBox01>
            <CheckBox02>false</CheckBox02>
            <CheckBox03>false</CheckBox03>
            <CheckBox04>false</CheckBox04>
            <CheckBox05>false</CheckBox05>
            <CurrencyCode>USD</CurrencyCode>
            <CountryNum>9</CountryNum>
            <LangNameID>enu</LangNameID>
            <BorderCrossing/>
            <FormatStr/>
            <BTName/>
            <BTAddress1/>
            <BTAddress2/>
            <BTAddress3/>
            <BTCity/>
            <BTState/>
            <BTZip/>
            <BTCountryNum>0</BTCountryNum>
            <BTCountry/>
            <BTPhoneNum/>
            <BTFaxNum/>
            <BTFormatStr/>
            <ParentCustNum>0</ParentCustNum>
            <TaxRegionCode/>
            <ICCust>false</ICCust>
            <ContBillDay>1</ContBillDay>
            <EMailAddress/>
            <ShippingQualifier/>
            <AllocPriorityCode/>
            <ReservePriorityCode/>
            <LinkPortNum>0</LinkPortNum>
            <WebCustomer>false</WebCustomer>
            <CustomerType>PRO</CustomerType>
            <NoContact>false</NoContact>
            <TerritoryLock>false</TerritoryLock>
            <CustURL/>
            <PendingTerritoryID/>
            <ExtID/>
            <ConsolidateSO>false</ConsolidateSO>
            <Bill-Frequency>W</Bill-Frequency>
            <CreditIncludePI>false</CreditIncludePI>
            <GlobalCust>false</GlobalCust>
            <ICTrader>false</ICTrader>
            <TaxAuthorityCode/>
            <ExternalDeliveryNote>false</ExternalDeliveryNote>
            <GlobalCredIncOrd>true</GlobalCredIncOrd>
            <GlobalCredIncPI>false</GlobalCredIncPI>
            <GlobalCurrencyCode/>
            <ExternalID/>
            <GlobalCreditHold/>
            <GlobalLock>false</GlobalLock>
            <CheckDuplicatePO>false</CheckDuplicatePO>
            <CreditLimit>0</CreditLimit>
            <CustPILimit>0</CustPILimit>
            <GlobalCreditLimit>0</GlobalCreditLimit>
            <GlobalPILimit>0</GlobalPILimit>
            <DocGlobalCreditLimit>0</DocGlobalCreditLimit>
            <DocGlobalPILimit>0</DocGlobalPILimit>
            <RfqAttachAllow>false</RfqAttachAllow>
            <DiscountQualifier>ADD</DiscountQualifier>
            <Number11>0</Number11>
            <Number12>0</Number12>
            <Number13>0</Number13>
            <Number14>0</Number14>
            <Number15>0</Number15>
            <Number16>0</Number16>
            <Number17>0</Number17>
            <Number18>0</Number18>
            <Number19>0</Number19>
            <Number20>0</Number20>
            <CheckBox06>false</CheckBox06>
            <CheckBox07>false</CheckBox07>
            <CheckBox08>false</CheckBox08>
            <CheckBox09>false</CheckBox09>
            <CheckBox10>false</CheckBox10>
            <CheckBox11>false</CheckBox11>
            <CheckBox12>false</CheckBox12>
            <CheckBox13>false</CheckBox13>
            <CheckBox14>false</CheckBox14>
            <CheckBox15>false</CheckBox15>
            <CheckBox16>false</CheckBox16>
            <CheckBox17>false</CheckBox17>
            <CheckBox18>false</CheckBox18>
            <CheckBox19>false</CheckBox19>
            <CheckBox20>false</CheckBox20>
            <ShortChar01/>
            <ShortChar02/>
            <ShortChar03/>
            <ShortChar04/>
            <ShortChar05/>
            <ShortChar06/>
            <ShortChar07/>
            <ShortChar08/>
            <ShortChar09/>
            <ShortChar10/>
            <AllowAltBillTo>false</AllowAltBillTo>
            <DemandDeliveryDays>0</DemandDeliveryDays>
            <DemandDateType>S</DemandDateType>
            <DemandAddLeadTime>0</DemandAddLeadTime>
            <DemandAddAction>B</DemandAddAction>
            <DemandChangeLeadTime>0</DemandChangeLeadTime>
            <DemandChangeAction>B</DemandChangeAction>
            <DemandCancelLeadTime>0</DemandCancelLeadTime>
            <DemandCancelAction>B</DemandCancelAction>
            <DemandNewLineLeadTime>0</DemandNewLineLeadTime>
            <DemandNewLineAction>B</DemandNewLineAction>
            <DemandQtyChangeLeadTime>0</DemandQtyChangeLeadTime>
            <DemandQtyChangeAction>B</DemandQtyChangeAction>
            <DemandChangeDateLeadTime>0</DemandChangeDateLeadTime>
            <DemandChangeDateAction>B</DemandChangeDateAction>
            <TradingPartnerName/>
            <ResDelivery>false</ResDelivery>
            <SatDelivery>false</SatDelivery>
            <SatPickup>false</SatPickup>
            <Hazmat>false</Hazmat>
            <DocOnly>false</DocOnly>
            <RefNotes/>
            <ApplyChrg>false</ApplyChrg>
            <ChrgAmount>0</ChrgAmount>
            <COD>false</COD>
            <CODFreight>false</CODFreight>
            <CODCheck>false</CODCheck>
            <CODAmount>0</CODAmount>
            <GroundType/>
            <NotifyFlag>false</NotifyFlag>
            <NotifyEMail/>
            <DeclaredIns>false</DeclaredIns>
            <DeclaredAmt>0</DeclaredAmt>
            <PeriodicityCode>0</PeriodicityCode>
            <ServSignature>false</ServSignature>
            <ServAlert>false</ServAlert>
            <ServHomeDel>false</ServHomeDel>
            <DeliveryType/>
            <ServPhone/>
            <ServInstruct/>
            <ServRelease>false</ServRelease>
            <ServAuthNum/>
            <ServRef1/>
            <ServRef2/>
            <ServRef3/>
            <ServRef4/>
            <ServRef5/>
            <EarlyBuffer>0</EarlyBuffer>
            <LateBuffer>0</LateBuffer>
            <DemandUnitPriceDiff>false</DemandUnitPriceDiff>
            <DemandUnitPriceDiffAction>B</DemandUnitPriceDiffAction>
            <ExcFromVal>false</ExcFromVal>
            <AddressVal>false</AddressVal>
            <RebateVendorNum>0</RebateVendorNum>
            <RebateForm/>
            <CreditCardOrder>false</CreditCardOrder>
            <DemandCheckForPart>false</DemandCheckForPart>
            <DemandCheckForPartAction>B</DemandCheckForPartAction>
            <ChangedBy/>
            <ChangeTime>0</ChangeTime>
            <ChargeCode/>
            <IndividualPackIDs>false</IndividualPackIDs>
            <IntrntlShip>false</IntrntlShip>
            <CertOfOrigin>false</CertOfOrigin>
            <CommercialInvoice>false</CommercialInvoice>
            <ShipExprtDeclartn>false</ShipExprtDeclartn>
            <LetterOfInstr>false</LetterOfInstr>
            <FFID/>
            <FFCompName/>
            <FFAddress1/>
            <FFAddress2/>
            <FFAddress3/>
            <FFCity/>
            <FFState/>
            <FFZip/>
            <FFCountry/>
            <FFCountryNum>0</FFCountryNum>
            <FFPhoneNum/>
            <NonStdPkg>false</NonStdPkg>
            <DeliveryConf>1</DeliveryConf>
            <AddlHdlgFlag>false</AddlHdlgFlag>
            <UPSQuantumView>false</UPSQuantumView>
            <UPSQVShipFromName/>
            <UPSQVMemo/>
            <UPSQVEmailType/>
            <FFContact/>
            <ETCAddrChg>false</ETCAddrChg>
            <TaxRoundRule>0</TaxRoundRule>
            <TaxMethod>L</TaxMethod>
            <SysRowID/>
            <SysRevID>0</SysRevID>
            <ValidPayer>true</ValidPayer>
            <ValidSoldTo>true</ValidSoldTo>
            <ValidShipTo>true</ValidShipTo>
            <OverrideRlsClass>false</OverrideRlsClass>
            <AcrossNatAcc>false</AcrossNatAcc>
            <NAParentCreditIsUsed>false</NAParentCreditIsUsed>
            <NACreditIsShare>false</NACreditIsShare>
            <NACreditPreferenceList>O</NACreditPreferenceList>
            <NAParentCreditPrc>0</NAParentCreditPrc>
            <NACreditSharedPrc>0</NACreditSharedPrc>
            <AllowOTS>false</AllowOTS>
            <ThirdPLCust>false</ThirdPLCust>
            <ManagedVendID/>
            <ManagedVendNum>0</ManagedVendNum>
            <NARlsClassCode/>
            <DirectDebiting>false</DirectDebiting>
            <ReminderCode/>
            <BitFlag>0</BitFlag>
            <GlbNAParentCreditIsUsed>false</GlbNAParentCreditIsUsed>
            <GlbNACreditIsShare>false</GlbNACreditIsShare>
            <GlbNAParentCreditPrc>0</GlbNAParentCreditPrc>
            <GlbNACreditSharedPrc>0</GlbNACreditSharedPrc>
            <AllowShipTo3>false</AllowShipTo3>
            <OTSSaveAs/>
            <CustPartOpts>M</CustPartOpts>
            <HasBank>false</HasBank>
            <PMUID>0</PMUID>
            <DemandCheckForRev>false</DemandCheckForRev>
            <OrderHoldForReview>false</OrderHoldForReview>
            <DemandCheckForRevAction>B</DemandCheckForRevAction>
            <ShipToTerrList/>
            <AcctRefNumber/>
            <ARInvoiceITCode/>
            <CreditMemoITCode/>
            <MiscCashRecITCode/>
            <LegalName/>
            <ARInvoiceAdjITCode/>
            <TaxRegReason/>
            <InvPerPackLine>false</InvPerPackLine>
            <OrgRegCode/>
            <DemandCloseRejSkd>false</DemandCloseRejSkd>
            <OurBankCode/>
            <DemandCloseNoMatch>false</DemandCloseNoMatch>
            <DmdCheckPartialShip>false</DmdCheckPartialShip>
            <DmdCheckShipAction>B</DmdCheckShipAction>
            <DemandCheckCUMM>false</DemandCheckCUMM>
            <DemandCheckCUMMAction>B</DemandCheckCUMMAction>
            <DemandPricing>Internal</DemandPricing>
            <PriceTolerance>0</PriceTolerance>
            <PreferredBank/>
            <CheckDateCapPromise>false</CheckDateCapPromise>
            <CheckConfirmCapPromise>false</CheckConfirmCapPromise>
            <CheckUpdateCapPromise>false</CheckUpdateCapPromise>
            <DemandCapPromiseDate>N</DemandCapPromiseDate>
            <DemandCapPromiseAction>B</DemandCapPromiseAction>
            <DemandCapPromiseUpdate>N</DemandCapPromiseUpdate>
            <PeriodicBilling>false</PeriodicBilling>
            <DueDateCriteria>S</DueDateCriteria>
            <PBTerms>0</PBTerms>
            <ERSOrder>false</ERSOrder>
            <DemandSplitSched>false</DemandSplitSched>
            <OTSmartString>false</OTSmartString>
            <DeferredRev>false</DeferredRev>
            <RACode/>
            <DemandCheckConfig>false</DemandCheckConfig>
            <DemandCheckCfgAction/>
            <ListCode/>
            <ShippingQualifierDesc/>
            <BillDayDesc>All Days</BillDayDesc>
            <TotOpenInvoices>0</TotOpenInvoices>
            <TotOpenOrders>0</TotOpenOrders>
            <TotOpenPI>0</TotOpenPI>
            <TotInvoiceCredit>0</TotInvoiceCredit>
            <TotOrderCredit>0</TotOrderCredit>
            <TotPICredit>0</TotPICredit>
            <TotOpenCredit>0</TotOpenCredit>
            <TotGlbInvoiceCredit>0</TotGlbInvoiceCredit>
            <TotGlbOrderCredit>0</TotGlbOrderCredit>
            <TotGlbPICredit>0</TotGlbPICredit>
            <TotGlbOpenCredit>0</TotGlbOpenCredit>
            <GlbFlag>false</GlbFlag>
            <ParentCustID/>
            <ParentName/>
            <PIFlag>false</PIFlag>
            <IntegrationFlag>false</IntegrationFlag>
            <AttrCodeList/>
            <SendShipment>true</SendShipment>
            <ApplyHoldToOrders>false</ApplyHoldToOrders>
            <FxdTotOrders>0</FxdTotOrders>
            <FxdTotPI>0</FxdTotPI>
            <FxdOrderCredit>0</FxdOrderCredit>
            <FxdPICredit>0</FxdPICredit>
            <FxdGlbOrdCredit>0</FxdGlbOrdCredit>
            <FxdGlbPICredit>0</FxdGlbPICredit>
            <GlbLink/>
            <CustTypeDescription>Prospect</CustTypeDescription>
            <BillFreqDescription>Weekly</BillFreqDescription>
            <DiscQualDescription>Add</DiscQualDescription>
            <AddrList/>
            <BTAddrList/>
            <ExtCoExist>true</ExtCoExist>
            <DspFormatStr/>
            <DspBTFormatStr/>
            <EnableGlobalCust>true</EnableGlobalCust>
            <EnableGlobalLock>false</EnableGlobalLock>
            <PeriodicityDesc/>
            <PeriodicityList/>
            <ChargeCodeDesc/>
            <NAParentCrdAvail>0</NAParentCrdAvail>
            <NAPoolCrdAvail>0</NAPoolCrdAvail>
            <NAChildCrdAvail>0</NAChildCrdAvail>
            <DspRlsClass/>
            <NAOwnCreditAvail>0</NAOwnCreditAvail>
            <NAOwnCreditUsedDsp>0</NAOwnCreditUsedDsp>
            <NAParentsCreditUsedDsp>0</NAParentsCreditUsedDsp>
            <NASharedCreditUsedDsp>0</NASharedCreditUsedDsp>
            <GlbNAParentsCreditUsedDsp>0</GlbNAParentsCreditUsedDsp>
            <GlbNAOwnCreditUsedDsp>0</GlbNAOwnCreditUsedDsp>
            <GlbNASharedCreditUsedDsp>0</GlbNASharedCreditUsedDsp>
            <GlbNAOwnCreditAvail>0</GlbNAOwnCreditAvail>
            <GlbNAParentCrdAvail>0</GlbNAParentCrdAvail>
            <GlbNAChildCrdAvail>0</GlbNAChildCrdAvail>
            <GlbNAPoolCrdAvail>0</GlbNAPoolCrdAvail>
            <NAPoolCreditUsed>0</NAPoolCreditUsed>
            <GlbNAPoolCreditUsed>0</GlbNAPoolCreditUsed>
            <NACreditUpdated>false</NACreditUpdated>
            <ReminderGroupDesc/>
            <NACreditCust>false</NACreditCust>
            <NATotalCreditAvail>0</NATotalCreditAvail>
            <NATotalCreditUsed>0</NATotalCreditUsed>
            <BaseCurrCode/>
            <TotLCCredit>0</TotLCCredit>
            <TotLCOpenOrders>0</TotLCOpenOrders>
            <TotLCCumInvoices>0</TotLCCumInvoices>
            <TotLCInvoiceBal>0</TotLCInvoiceBal>
            <TotLCUsed>0</TotLCUsed>
            <TotOpenLC>0</TotOpenLC>
            <TotOpenOrderLC>0</TotOpenOrderLC>
            <TotOpenInvoicesLC>0</TotOpenInvoicesLC>
            <InvcOrderCmpDflt>false</InvcOrderCmpDflt>
            <EntityUseCode/>
            <MXMunicipio/>
            <OneTimeID/>
            <IsOneTimeCust>false</IsOneTimeCust>
            <Collections>false</Collections>
            <BTLegalName/>
            <PEIdentityDocType>6</PEIdentityDocType>
            <PECollectionAgent>false</PECollectionAgent>
            <PEDocumentID/>
            <PEGoodsContributor>false</PEGoodsContributor>
            <PENoAddress>false</PENoAddress>
            <PENotFound>false</PENotFound>
            <PEWithholdAgent>false</PEWithholdAgent>
            <PEGuaranteeName/>
            <PEGuaranteeAddress1/>
            <PEGuaranteeAddress2/>
            <PEGuaranteeAddress3/>
            <PEGuaranteeCity/>
            <PEGuaranteeState/>
            <PEGuaranteeZip/>
            <PEGuaranteeCountry/>
            <PEGuaranteePhoneNum/>
            <PEGuaranteeTaxID/>
            <COASegReferences/>
            <CurrencyCurrName>Base Currency.</CurrencyCurrName>
            <CurrencyCurrSymbol>$</CurrencyCurrSymbol>
            <CurrencyCurrDesc>Base Currency.</CurrencyCurrDesc>
            <CurrencyCurrencyID/>
            <CurrencyDocumentDesc/>
            <CustGrupGroupDesc/>
            <DeliveryTypeDescription/>
            <FOBDescription/>
            <GlobalCurrencyCurrencyID/>
            <GlobalCurrencyDocumentDesc/>
            <GlobalCurrencyCurrName/>
            <GlobalCurrencyCurrDesc/>
            <GlobalCurrencyCurrSymbol/>
            <LanguageDescription>English/United States</LanguageDescription>
            <MarkUpDescription/>
            <PayMethodName/>
            <PayMethodSummarizePerCustomer>false</PayMethodSummarizePerCustomer>
            <PayMethodType>0</PayMethodType>
            <PreferredBankBankName/>
            <PreferredBankDescription/>
            <RASchedCdRADesc/>
            <ReservePriDescription/>
            <SalesRepName/>
            <ShipViaDescription/>
            <ShipViaWebDesc/>
            <TATaxAuthorityDescription/>
            <TaxRegionDescription/>
            <TermsDescription>DM FAVORABLE</TermsDescription>
            <TerritoryTerritoryDesc/>
            <RowIdent/>
            <RowMod>A</RowMod>
          </Customer>")
	end
end