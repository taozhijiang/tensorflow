Ř.
Ö	Ş	
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
H
ShardedFilename
basename	
shard

num_shards
filename
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.13.22b'v1.13.2-5-g04256c89d8'ě 
k
x-input1Placeholder*
dtype0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
shape:˙˙˙˙˙˙˙˙˙
k
x-input2Placeholder*
shape:˙˙˙˙˙˙˙˙˙*
dtype0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
G
ConstConst*
value	B :
*
dtype0*
_output_shapes
: 
l
weight-n
VariableV2*
_output_shapes
: *
	container *
shape: *
shared_name *
dtype0

weight-n/AssignAssignweight-nConst*
use_locking(*
T0*
_class
loc:@weight-n*
validate_shape(*
_output_shapes
: 
a
weight-n/readIdentityweight-n*
T0*
_class
loc:@weight-n*
_output_shapes
: 
f
Const_1Const*
dtype0*
_output_shapes
: *
value	B :d*
_class
loc:@weight-n

bias-n
VariableV2*
shape: *
dtype0*
_output_shapes
: *
shared_name *
_class
loc:@weight-n*
	container 

bias-n/AssignAssignbias-nConst_1*
_class
loc:@weight-n*
validate_shape(*
_output_shapes
: *
use_locking(*
T0
]
bias-n/readIdentitybias-n*
T0*
_class
loc:@weight-n*
_output_shapes
: 
P
AddAddx-input1x-input2*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
P
MulMulAddweight-n/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
b
y-outputAddMulbias-n/read"/device:CPU:0*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
.
initNoOp^bias-n/Assign^weight-n/Assign
Y
save/filename/inputConst*
_output_shapes
: *
valueB Bmodel*
dtype0
n
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
dtype0*
_output_shapes
: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 

save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_71bdace5d66e4ca3b7b659747c1b596a/part
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 

save/SaveV2/tensor_namesConst"/device:CPU:0*%
valueBBbias-nBweight-n*
dtype0*
_output_shapes
:
v
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
valueBB B *
dtype0*
_output_shapes
:

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbias-nweight-n"/device:CPU:0*
dtypes
2
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
Ź
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*

axis *
N*
_output_shapes
:*
T0

save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
_output_shapes
: *
T0

save/RestoreV2/tensor_namesConst"/device:CPU:0*%
valueBBbias-nBweight-n*
dtype0*
_output_shapes
:
y
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
valueBB B *
dtype0*
_output_shapes
:
¤
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2*
_output_shapes

::

save/AssignAssignbias-nsave/RestoreV2*
use_locking(*
T0*
_class
loc:@weight-n*
validate_shape(*
_output_shapes
: 

save/Assign_1Assignweight-nsave/RestoreV2:1*
use_locking(*
T0*
_class
loc:@weight-n*
validate_shape(*
_output_shapes
: 
8
save/restore_shardNoOp^save/Assign^save/Assign_1
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"
trainable_variablestr
9

weight-n:0weight-n/Assignweight-n/read:02Const:08
5
bias-n:0bias-n/Assignbias-n/read:02	Const_1:08"
	variablestr
9

weight-n:0weight-n/Assignweight-n/read:02Const:08
5
bias-n:0bias-n/Assignbias-n/read:02	Const_1:08*˝
serving_defaultŠ
-
x-input1!

x-input1:0˙˙˙˙˙˙˙˙˙
-
x-input2!

x-input2:0˙˙˙˙˙˙˙˙˙-
y-output!

y-output:0˙˙˙˙˙˙˙˙˙tensorflow/serving/predict