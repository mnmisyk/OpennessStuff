<!-- main.xslt -->  
  
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">  
  
  <!-- 定义C#代码中的参数 -->  
  <xsl:param name="blockName" />  
  <xsl:param name="insertCount"  />  
  
  <!-- 处理原始XML内容 -->  
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
					<xsl:apply-templates select="node()" />
					<xsl:call-template name="insertBlock">
						<xsl:with-param name="count" select="$insertCount" />
					</xsl:call-template>
					<!-- 1232323111111111111111111111111111 -->

						
					<MultilingualText CompositionName="Title"
									  ID="3">
						<ObjectList>
							<MultilingualTextItem CompositionName="Items"
												  ID="4">
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
  
  <!-- 处理原始XML中的节点 -->  
  <xsl:template match="node()">  
    <!-- 处理原始XML中的节点内容 -->  
    <xsl:copy>  
      <xsl:apply-templates select="@*|node()" />  
    </xsl:copy>  
  </xsl:template>  
  
  <!-- 插入指定次数的块 -->  
  <xsl:template name="insertBlock">  
    <xsl:param name="count"  select="0"/>  
    <xsl:choose>  
      <!-- 当还有剩余次数时，插入块   /SW.Blocks.CompileUnit/AttributeList/NetworkSource/FlgNet/Parts/Call/CallInfo[@Name=$blockName]-->  
      <xsl:when test="$count > 0">  
        <xsl:apply-templates select="document('FB1.xml')/SW.Blocks.CompileUnit/*" />  
        <xsl:call-template name="insertBlock">  
          <xsl:with-param name="count" select="$count - 1" />  
        </xsl:call-template>  
      </xsl:when>  
      <!-- 当没有剩余次数时，结束递归 -->  
      <xsl:otherwise>  
        <!-- 继续处理原始XML的其余部分 -->  
        <xsl:apply-templates select="node()" />  
      </xsl:otherwise>  
    </xsl:choose>  
  </xsl:template>  
  
</xsl:stylesheet>  