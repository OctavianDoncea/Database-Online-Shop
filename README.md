# Database-Online-Shop

Baza de date este proiectata pentru a gestiona un magazin online. Aceasta va retine produsele din stoc, precum date despre clienti si comenzile facute de acestia. 

Clientii vor putea face comenzi, fiecare comanda avand un anumit numar de produse, numele + numarul de telefon al clientului, adresa livrarii si comentarii legate de comanda. Pentru sistemul de comenzi, site-ul va realiza urmatoarea procesare: se verifica in tabelul “Cos_cumparaturi” produsele al caror “ID_produs” e Null (adica nu apartin niciunei comenzi), iar acestea vor face parte din noua comanda. Dupa, “ID_comanda” se schimba in id-ul comenzii respective. 
