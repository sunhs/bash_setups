# git clone git@github.com:sunhs/fastjump.git tmp_fastjump
# cd tmp_fastjump/main && make
# cd ../.. && rm -rf tmp_fastjump

git clone git@github.com:sunhs/pyfj.git tmp_pyfj
cd tmp_pyfj && pip install -e .
cd .. && rm -rf tmp_pyfj
