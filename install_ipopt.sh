# Pass the Ipopt source directory as the first argument
if [ -z $1 ]
then
    echo "Specifiy the location of the Ipopt source directory in the first argument."
    exit
fi
cd $1

prefix=/usr/local
srcdir=$PWD

echo "Building Ipopt from ${srcdir}"
echo "Saving headers and libraries to ${prefix}"

# MUMPS
cd $srcdir/ThirdParty/Mumps
./get.Mumps

# build everything
cd $srcdir
./configure --prefix=$prefix coin_skip_warn_cxxflags=yes \
    --with-blas="$prefix/lib/libcoinblas.a -lgfortran" \
    --with-lapack=$prefix/lib/libcoinlapack.a
make
make test
make -j1 install
