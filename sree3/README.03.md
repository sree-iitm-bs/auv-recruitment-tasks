## Task 0

### Question 3 Summary

For question 3 I had to make 2 custom messages. I used the pose2d dataype from geometry_msgs but while making the statemachine I wanted to include the z axis too. So I made a new custom variable fsm_custom which has float32 or float64 im unsure TT for the 3 axes and a direction String. I had to create a new directory called msg and I wrote my .msg files. I then had to make necessary changes in CMakeLists and package.xml. So that I can import my custom dataype in my code. Also learnt about the 6 DOF model.

**From Wikipedia**:  
Six degrees of freedom (6DOF), or sometimes six degrees of movement, refers to the six mechanical degrees of freedom of movement of a rigid body in three-dimensional space. Specifically, the body is free to change position as forward/backward (surge), up/down (heave), left/right (sway) translation in three perpendicular axes, combined with changes in orientation through rotation about three perpendicular axes, often termed yaw (normal axis), pitch (transverse axis), and roll (longitudinal axis).

**Translational envelopes:**
- Moving forward and backward on the X-axis. *(Surge)*
- Moving left and right on the Y-axis. *(Sway)*
- Moving up and down on the Z-axis. *(Heave)*

**Rotational envelopes:**
- Tilting side to side on the X-axis. *(Roll)*
- Tilting forward and backward on the Y-axis. *(Pitch)*
- Turning left and right on the Z-axis. *(Yaw)*

In terms of a headset, such as the kind used for virtual reality, rotational envelopes can also be thought of in the following terms:
- **Pitch**: Nodding "yes"
- **Yaw**: Shaking "no"
- **Roll**: Bobbling from side to side
