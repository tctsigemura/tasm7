#
# Makefile.tac : C--言語からTacの実行形式に変換する手順
#

Tasm7.exe: Tasm7.cmm
	cm2e -o Tasm7 Tasm7.cmm

clean:
	rm -f Tasm7.exe Tasm7.map
