#include<stdio.h>
struct point
{
	int x;
	int y;
	int z;
};
int main()
{
	struct point pt[10];
	int i;
	printf("%d",sizeof(pt));
		printf("co-ordinates are:-");
	for(i=0;i<6;i++)
	{
		scanf("%d%d%d",&pt[i].x,&pt[i].y,&pt[i].z);
	}
	printf("co-ordinates are:-");
	for(i=0;i<6;i++)
	{
		printf("%d%d%d",pt[i].x,pt[i].y,pt[i].z);
	}
}