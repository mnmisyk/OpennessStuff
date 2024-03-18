<!-- insert.xslt -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="ExternalTimes"/>
	<xsl:param name="ExternalID"/>
    <xsl:template match="/">
 <Document>
			<Engineering version="V18" />
			<SW.Blocks.OB ID="0">
				<AttributeList>
					<AutoNumber>true</AutoNumber>
					<HeaderAuthor />
					<HeaderFamily />
					<HeaderName />
					<HeaderVersion>0.1</HeaderVersion>
					<Interface>
						<Sections xmlns="http://www.siemens.com/automation/Openness/SW/Interface/v5">
							<Section Name="Input">
								<Member Accessibility="Public"
										Datatype="Bool"
										Informative="true"
										Name="Initial_Call">
									<Comment>
										<MultiLanguageText Lang="en-US">Initial call of this OB</MultiLanguageText>
									</Comment>
								</Member>
								<Member Accessibility="Public"
										Datatype="Bool"
										Informative="true"
										Name="Remanence">
									<Comment>
										<MultiLanguageText Lang="en-US">=True, if remanent data are available</MultiLanguageText>
									</Comment>
								</Member>
							</Section>
							<Section Name="Temp" />
							<Section Name="Constant" />
						</Sections>
					</Interface>
					<IsIECCheckEnabled>false</IsIECCheckEnabled>
					<MemoryLayout>Optimized</MemoryLayout>
					<Name>Main</Name>
					<Namespace />
					<Number>1</Number>
					<ProgrammingLanguage>LAD</ProgrammingLanguage>
					<SecondaryType>ProgramCycle</SecondaryType>
					<SetENOAutomatically>false</SetENOAutomatically>
				</AttributeList>
				<ObjectList>
					<MultilingualText CompositionName="Comment"
									  ID="1">
						<ObjectList>
							<MultilingualTextItem CompositionName="Items"
												  ID="2">
								<AttributeList>
									<Culture>zh-CN</Culture>
									<Text />
								</AttributeList>
							</MultilingualTextItem>
						</ObjectList>
					</MultilingualText>
					<!-- 在指定位置插入导入的XML文件内容 -->
					 <xsl:call-template name="insert">
                        <!-- <xsl:with-param name="content" select="document('source.xml')/*" /> -->
                        <xsl:with-param name="times" select="$ExternalTimes" />
						<xsl:with-param name="external_id" select="$ExternalID" />
                    </xsl:call-template>
					<!-- 1232323111111111111111111111111111 -->

						
					<MultilingualText CompositionName="Title"
									  ID="5000">
						<ObjectList>
							<MultilingualTextItem CompositionName="Items" ID="5001">
												  
								<AttributeList>
									<Culture>zh-CN</Culture>
									<Text>"Main Program Sweep (Cycle)"</Text>
								</AttributeList>
							</MultilingualTextItem>
						</ObjectList>
					</MultilingualText>
				</ObjectList>
			</SW.Blocks.OB>
		</Document>
    </xsl:template>
 
    <xsl:template name="insert">
        <!-- <xsl:param name="content" /> -->
        <xsl:param name="times" />
		<xsl:param name="external_id" />
        <xsl:if test="$times &gt; 0">
            <!-- <xsl:copy-of select="$content" /> -->
			<xsl:call-template name="FbBlock">
				 <xsl:with-param name="IncreasingID" select="$external_id " />
			</xsl:call-template>

            <xsl:call-template name="insert">
                <!-- <xsl:with-param name="content" select="$content" /> -->
                <xsl:with-param name="times" select="$times - 1" />
				 <xsl:with-param name="external_id" select="$external_id+200" />  
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <xsl:template name ="FbBlock">

		<xsl:param name="IncreasingID" />
         <!-- source.xml -->
		<SW.Blocks.CompileUnit CompositionName="CompileUnits" ID="{$IncreasingID}">						  
			<AttributeList>
				<NetworkSource>
					<FlgNet xmlns="http://www.siemens.com/automation/Openness/SW/NetworkSource/FlgNet/v4">
						<Parts>
							<Call UId="21">
								<CallInfo BlockType="FB"
										Name="FB_Test_01">
									<Instance Scope="GlobalVariable"
											UId="22">
										<Component Name="FB_Test_01_DB_2" />
									</Instance>
									<Parameter Name="ix_sw"
											Section="Input"
											Type="Bool" />
									<Parameter Name="iw_pos"
											Section="Input"
											Type="Int" />
									<Parameter Name="iudt"
											Section="Input"
											Type="&quot;Udt01&quot;" />
									<Parameter Name="istruct"
											Section="Input"
											Type="Struct" />
									<Parameter Name="qw_pos"
											Section="Output"
											Type="Int" />
									<Parameter Name="qx_set"
											Section="Output"
											Type="Bool" />
									<Parameter Name="iqw_posSet"
											Section="InOut"
											Type="Int" />
								</CallInfo>
							</Call>
						</Parts>
						<Wires>
							<Wire UId="30">
								<Powerrail />
								<NameCon Name="en"
										UId="21" />
							</Wire>
							<Wire UId="31">
								<OpenCon UId="23" />
								<NameCon Name="ix_sw"
										UId="21" />
							</Wire>
							<Wire UId="32">
								<OpenCon UId="24" />
								<NameCon Name="iw_pos"
										UId="21" />
							</Wire>
							<Wire UId="33">
								<OpenCon UId="25" />
								<NameCon Name="iudt"
										UId="21" />
							</Wire>
							<Wire UId="34">
								<OpenCon UId="26" />
								<NameCon Name="istruct"
										UId="21" />
							</Wire>
							<Wire UId="35">
								<OpenCon UId="27" />
								<NameCon Name="iqw_posSet"
										UId="21" />
							</Wire>
							<Wire UId="36">
								<NameCon Name="qw_pos"
										UId="21" />
								<OpenCon UId="28" />
							</Wire>
							<Wire UId="37">
								<NameCon Name="qx_set"
										UId="21" />
								<OpenCon UId="29" />
							</Wire>
						</Wires>
					</FlgNet>
				</NetworkSource>
				<ProgrammingLanguage>LAD</ProgrammingLanguage>
			</AttributeList>
			<ObjectList>
				<MultilingualText CompositionName="Comment"
								ID="{$IncreasingID+1}">
					<ObjectList>
						<MultilingualTextItem CompositionName="Items"
											ID="{$IncreasingID+2}">
							<AttributeList>
								<Culture>zh-CN</Culture>
								<Text />
							</AttributeList>
						</MultilingualTextItem>
					</ObjectList>
				</MultilingualText>
				<MultilingualText CompositionName="Title"
								ID="{$IncreasingID+3}">
					<ObjectList>
						<MultilingualTextItem CompositionName="Items"
											ID="{$IncreasingID+4}">
							<AttributeList>
								<Culture>zh-CN</Culture>
								<Text>Network2_comment</Text>
							</AttributeList>
						</MultilingualTextItem>
					</ObjectList>
				</MultilingualText>
			</ObjectList>
</SW.Blocks.CompileUnit>

    </xsl:template>
</xsl:stylesheet>