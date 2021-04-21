echo "========================================================="
echo "Installing fastjump."
echo "========================================================="
git clone git@github.com:sunhs/fastjump.git
cd fastjump/main && make
cd - && rm -rf fastjump