require './lib/PDFNetWrappers/PDFNetC/Lib/PDFNetRuby'
include PDFNetRuby
require './lib/PDFNetWrappers/Samples/LicenseKey/RUBY/LicenseKey'

class InvoicesController < ApplicationController

  def convertToCentString (f)
   return (((((f)*100).to_i).to_d)/100).to_s
  end
  def index
    logger.debug("AAA")
      @invoices = scope
  end

  def show
      @invoice = scope.find(params[:id])
      invMod = Object.new
      invMod.instance_variable_set(:@id, @invoice.id.to_s)
      invMod.instance_variable_set(:@subtotal, convertToCentString(@invoice.subtotal))
      invMod.instance_variable_set(:@discount_calculated, convertToCentString(@invoice.discount_calculated))
      invMod.instance_variable_set(:@vat_calculated, convertToCentString(@invoice.vat_calculated))
      invMod.instance_variable_set(:@total, convertToCentString(@invoice.total));
      invMod.instance_variable_set(:@from_full_name, @invoice.from_full_name);
      invMod.instance_variable_set(:@from_address, @invoice.from_address);
      invMod.instance_variable_set(:@from_email, @invoice.from_email);
      invMod.instance_variable_set(:@from_phone, @invoice.from_phone);
      invMod.instance_variable_set(:@to_full_name, @invoice.to_full_name);
      invMod.instance_variable_set(:@to_address, @invoice.to_address);
      invMod.instance_variable_set(:@to_email, @invoice.to_email);
      invMod.instance_variable_set(:@to_phone, @invoice.to_phone);
      invMod.instance_variable_set(:@created_at, (@invoice.created_at).strftime('%d/%m/%Y'));
      invMod.instance_variable_set(:@due_at, (@invoice.created_at + 1.month).strftime('%d/%m/%Y'));
      invMod.instance_variable_set(:@discount, @invoice.discount);
      invMod.instance_variable_set(:@vat, @invoice.vat);
      invMod.instance_variable_set(:@status, @invoice.status);

      # add the rows
      rows = []
      @invoice.invoice_items.each do |key, item|
        row= Object.new
        row.instance_variable_set(:@name, key.name);
        row.instance_variable_set(:@description, key.description);
        row.instance_variable_set(:@price, key.price);
        row.instance_variable_set(:@qty, key.qty.to_s);
        row.instance_variable_set(:@total, key.qty.to_d * key.price.to_d);
        rows << row
      end

      invMod.instance_variable_set(:@rows, rows)
      json = invMod.to_json

      respond_to do |format|
        format.html 
        format.pdf do
          PDFNet.Initialize(PDFTronLicense.Key)
          $inputPath = "./app/assets/files/"
          inputFilename = "template.docx"

          # Create a TemplateDocument object from an input office file.
          inputFile = $inputPath + inputFilename
          templateDoc = Convert.CreateOfficeTemplate(inputFile, nil)

          # Fill the template with data from a JSON string, producing a PDF document.
          pdfdoc = templateDoc.FillTemplateJson(json)
          buffer = pdfdoc.Save(SDFDoc::E_linearized)

          send_data(buffer, filename: 'my-awesome-pdf.pdf', type: 'application/pdf', :disposition=>'inline')
          PDFNet.Terminate()
        end
      end   
  end

  private
      def scope
          ::Invoice.all.includes(:invoice_items)
      end
end