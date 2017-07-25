**Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms.**

For more information go to http://eigen.tuxfamily.org/.

**1.Student describes their model in detail. This includes the state, actuators and update equations.**

I choose states as follows,x,y,psi,v.I choose actutators as follows delta,a,the update equations are in line 41-118 of mpc.cpp.

**2.Student discusses the reasoning behind the chosen N (timestep length) and dt (elapsed duration between timesteps) values. Additionally the student details the previous values tried.**

I tried N=20,dt=0.05,but these values can't run 60mph,then I tune N=15,dt=0.05 then it can run 60 mph.The reason is when N is large,it will predict more future,and large error to trajectory line.So when speed is high,I choose small N.If dt is large,the predition will course large error,but if large can deal with latency good.If dt is small,small error,not good at latency,so it's trade off to tune N and dt.

**A polynomial is fitted to waypoints.
If the student preprocesses waypoints, the vehicle state, and/or actuators prior to the MPC procedure it is described.**

I use three order ploynomial to fit waypoints. I precess all waypoint to vehicle coordinates in line 129-137 of main.cpp and translate all state to vechicle coordinate.

**The student implements Model Predictive Control that handles a 100 millisecond latency. Student provides details on how they deal with latency.**

I use kinematic model to predict vehicle's state 0.1 seconds later in line 151-160 of mpc.cpp to deal with latency.


