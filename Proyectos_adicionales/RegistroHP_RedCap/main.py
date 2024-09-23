from PyPDF2 import PdfReader, PdfWriter

def split_pdf(input_pdf, output_prefix, pages_per_split=5):
    pdf_reader = PdfReader(open(input_pdf, 'rb'))
    total_pages = len(pdf_reader.pages)
    
    for i in range(0, total_pages, pages_per_split):
        pdf_writer = PdfWriter()
        for j in range(i, min(i + pages_per_split, total_pages)):
            pdf_writer.add_page(pdf_reader.pages[j])
        
        output_filename = f"{output_prefix}_part_{i // pages_per_split + 1}.pdf"
        with open(output_filename, 'wb') as output_pdf:
            pdf_writer.write(output_pdf)
        print(f"Created: {output_filename}")

# Uso de la función
split_pdf('Registros_att.pdf', 'salida', 5)
