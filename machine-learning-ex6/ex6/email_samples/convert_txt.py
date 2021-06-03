import os

hams = os.listdir('easy_ham')
spams = os.listdir('spam')

def convert_to_txt(filenames, path):
    for i in range(len(filenames)):
        try:
            file = open(path + filenames[i], 'r')
            write = file.read()
            file1 = open(path + f'{i}.txt', 'w')
            file1.write(write)
            file1.close()
            file.close()
            os.remove(path + filenames[i])
        except:
            pass

if __name__ == '__main__':
    #convert_to_txt(hams, 'easy_ham/')
    convert_to_txt(spams, 'spam/')

