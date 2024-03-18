using FbFcCallerIntoOb1;
using FbFcCallerIntoOb1.models;
using System;
using System.Xml;
using System.Xml.Xsl;

class Program
{
    static void Main()
    {
        // 加载XSLT文件
        //XslCompiledTransform transform = new XslCompiledTransform();

        //XsltSettings settings = new XsltSettings();
        //settings.EnableDocumentFunction = true;

        //transform.Load("insert.xslt", settings , new XmlUrlResolver());


        // Create the XsltArgumentList.
        //XsltArgumentList xslArg = new XsltArgumentList();

        // Create a parameter which represents the current date and time.
        
        //xslArg.AddParam("ExternalTimes", "", "5"); //setting times to call
        //xslArg.AddParam("ExternalID", "", "100"); //id start number

        Wrapper _wrapper = new Wrapper();
        _wrapper.GenerateXml(new Model_InsertFb(), "output.xml", "insert.xslt");

        //// 创建XmlTextWriter用于输出结果
        //using (XmlWriter writer = XmlWriter.Create("output.xml"))
        //{
        //    // 应用XSLT转换
        //    transform.Transform("source.xml", xslArg,writer);
        //}
    }
}