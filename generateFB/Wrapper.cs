using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;
using System.Xml.Xsl;

namespace FbFcCallerIntoOb1
{
    internal class Wrapper
    {
        public  void GenerateXml(object source, string destinationPath, string templatePath)
        {
            String filename = "temp.xml";
            TextWriter writer = new StreamWriter(filename);
            XmlSerializer serializer = new XmlSerializer(source.GetType());
            serializer.Serialize(writer, source);
            writer.Close();

            XsltSettings settings = new XsltSettings();
            settings.EnableDocumentFunction = true;
            // Load the style sheet.
            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load(templatePath, settings, new XmlUrlResolver() );

            // Execute the transform and output the results to a file.
            xslt.Transform(filename, destinationPath);
            File.Delete(filename);
        }
    }
}
