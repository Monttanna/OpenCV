#Source Code Steps For Installation

#1. Download Scipy Stack:
 sudo apt-get update
 sudo apt-get upgrade  
 sudo apt-get install python-numpy  python-matplotlib
        python-pandas python-sympy python-nose python-scipy
        
        
#2. Download opencv:

# install basic development environment
sudo apt-get install build-essential cmake pkg-config unzip
# install opencv dependencies. 
sudo apt-get install build-essential cmake git
sudo apt-get install pkg-config unzip ffmpeg  python-dev python3-dev python-numpy python3-numpy
sudo apt-get install libopencv-dev libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev 
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev 
sudo apt-get install libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libtheora-dev 
sudo apt-get install libvorbis-dev libxvidcore-dev v4l-utils libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install libjasper-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install libjpeg8-dev libx264-dev libatlas-base-dev gfortran


# additional dependencies for java support
sudo apt-get install default-jdk ant


cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip
unzip opencv.zip

# compile opencv
tar xzvf opencv-2.4.9.13.tar.gz
cd opencv-2.4.9.13
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D INSTALL_C_EXAMPLES=ON  
        -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON
        -D WITH_QT=ON -D CMAKE_INSTALL_PREFIX=/usr/local
        -D WITH_OPENGL=ON -D WITH_V4L=ON -D WITH_CUDA=ON
        -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_TBB=ON ..
        
        
make
sudo make install

sudo nano /etc/ld.so.conf.d/opencv.conf

#type this into the file
/usr/local/lib

sudo ldconfig
sudo nano /etc/bash.bashrc

PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH



cd ~/OpenCV-2.4.9.13/samples/cpp


#include <opencv2/opencv.hpp> //Include file for every supported OpenCV function


int main( int argc, char** argv ) {

    cv::Mat imgOriginal;

    imgOriginal = cv::imread("building.jpg"); 


    //cv::Mat img = cv::imread("building.jpg");
    if( imgOriginal.empty() ) return -1;
    cv::namedWindow( "Example1", cv::WINDOW_AUTOSIZE );
    cv::imshow( "Example1", imgOriginal );
    cv::waitKey( 0 );
    cv::destroyWindow( "Example1" );
    return 0;
}





 
#try the examples and make sure they work
 
 python ~/OpenCV-2.4.6/samples/python2/turing.py
#Link for people that are having problems with the different versions of Ubuntu: 
#http://answers.opencv.org/question/18226/opencv-java-build-error-in-ubuntu-1304/
