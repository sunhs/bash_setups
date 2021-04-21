echo "========================================================="
echo "Installing fastjump."
echo "========================================================="
git clone git@github.com:sunhs/fastjump.git tmp_fastjump
cd tmp_fastjump/main && make
cd - && rm -rf tmp_fastjump