def ObtenerPuntos():
  datos = open('Coordenadas.txt','r')
  fcols = open('Columnas.txt','w')
  ffils = open('Filas.txt','w')

  for coor in datos:
    coor = coor.rstrip('\n')
    coor = coor[1:-4]+','
    num = ''
    flag = True
    for char in coor:
      if char == ',':
        if flag:
          fcols.write(num+'\n')
        else:
          ffils.write(num[1:]+'\n')
        flag = not flag
        num = ''
        continue
      num += char

  ffils.close()
  fcols.close()
  datos.close()


def Veccols2Vecfils(file_cols,file_fils):
  fcols = open(file_cols,'r')
  ffils = open(file_fils,'r')

  listcols = ''
  listfils = ''

  for numcols in fcols:
    listcols += numcols.rstrip('\n')+' '
  
  for numfils in ffils:
    listfils += numfils.rstrip('\n')+' '

  fcols.close()
  ffils.close()

  return listcols,listfils

ObtenerPuntos()

col,fil = Veccols2Vecfils('Columnas.txt','Filas.txt')

print(f'x = [{col[:-1]}];')
print(f'y = [{fil[:-1]}];')