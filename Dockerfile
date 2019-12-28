FROM ros:melodic

# Add non-priviledged user
ARG USERNAME="ros"
RUN groupadd -g 1000 $USERNAME && \
    useradd -r -u 1000 -g $USERNAME $USERNAME

# NOTE: The home directory of the ros user is used as ros workspace.
ARG HOMEDIR="/home/$USERNAME"
ENV ROS_WORKDIR=$HOMEDIR
RUN mkdir $ROS_WORKDIR && \
    mkdir "$ROS_WORKDIR/src" && \
    chown -R "$USERNAME:$USERNAME" $HOMEDIR

# Install needed dependencies
RUN apt-get update && \
    apt-get install -y protobuf-compiler libprotobuf-dev libprotoc-dev

# Copy contents for needed for build
COPY src/ "$ROS_WORKDIR/src"
COPY .catkin_workspace $ROS_WORKDIR
RUN chown -R ros:ros $ROS_WORKDIR

USER ros

# Build ros workspace
COPY scripts/build_workspace.sh $ROS_WORKDIR
RUN $ROS_WORKDIR/build_workspace.sh

COPY scripts/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
